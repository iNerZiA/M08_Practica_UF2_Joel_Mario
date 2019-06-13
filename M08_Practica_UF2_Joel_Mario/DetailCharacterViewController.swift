//
//  DetailCharacterViewController.swift
//  M08_Practica_UF2_Joel_Mario
//
//  Created by Alumne on 06/05/2019.
//  Copyright © 2019 Alumne. All rights reserved.
//

import UIKit
import AVFoundation

class DetailCharacterViewController: UIViewController {

    
    
    @IBOutlet weak var characterImage: UIImageView!{
        didSet{
            let tapHeroe = UITapGestureRecognizer(target: self, action:#selector(soundHeroe(_:)))
            characterImage.addGestureRecognizer(tapHeroe)
            let panHeroe = UIPanGestureRecognizer(target: self, action: #selector(panHeroe(_:)))
            characterImage.addGestureRecognizer(panHeroe)
        }
    }
    
    
    @IBOutlet weak var characterName: UILabel!
    
    var Image = UIImage()
    var name = ""
    
    var HeroeSound: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        characterImage.image = Image
        characterName.text = name
        
        //cogemos el sonido para el tap en la image
        if let soundURL = Bundle.main.url(forResource: "breach", withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &HeroeSound)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rotateHeroe(characterImage)
    }
    
    func rotateHeroe(_ sender: UIImageView){
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        animator.startAnimation()
    }
    
    
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "breach", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    
    @objc func soundHeroe(_ sender: UITapGestureRecognizer){
        AudioServicesPlaySystemSound(HeroeSound)
    }

    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer, HeroeView: UIImageView){
        switch sender.state{
        case .changed:
            let translation = sender.translation(in: HeroeView)
            let transforming = CGAffineTransform(translationX: translation.x, y: translation.y)
            HeroeView.transform = transforming
        //sender.setTranslation(CGPoint.zero, in: HeroeView)
        case .ended:
            let HeroeAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
                HeroeView.transform = CGAffineTransform.identity
            }
            HeroeAnimator.startAnimation()
            sender.setTranslation(CGPoint.zero, in: HeroeView)
        default:
            break
        }
    }
    
    //revisar el gesture recognizer no reconoce nada
    @objc func panHeroe(_ sender: UIPanGestureRecognizer) {
        panGesture(sender, HeroeView: characterImage)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
