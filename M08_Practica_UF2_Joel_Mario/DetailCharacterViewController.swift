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

    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    var Image = UIImage()
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        characterImage.image = Image
        characterName.text = name
    }
    
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "btn_click_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    @IBAction func PianoC(sender: AnyObject) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
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
