//
//  ViewController.swift
//  M08_Practica_UF2_Joel_Mario
//
//  Created by Alumne on 29/04/2019.
//  Copyright © 2019 Alumne. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let characters = ["Iron Man","Thor","Thanos","Ronin","Natasha Romanoff","Captain America","War Machine","Spiderman","Captain Marvel","Rocket","Hulk","Black Panther"]
    
    let charactersImage: [UIImage] = [
        UIImage(named: "ironman")!,
        UIImage(named: "thor")!,
        UIImage(named: "thanos")!,
        UIImage(named: "ronin")!,
        UIImage(named: "romanoff")!,
        UIImage(named: "capitan_america")!,
        UIImage(named: "war machine")!,
        UIImage(named: "spiderman")!,
        UIImage(named: "captain marvel")!,
        UIImage(named: "rocket")!,
        UIImage(named: "hulk")!,
        UIImage(named: "black panther")!,
        

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CharacterCollectionViewCell
        
        cell.characterName.text = characters[indexPath.item]
        cell.characterImage.image = charactersImage[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let desVC = storyboard!.instantiateViewController(withIdentifier: "DetailCharacterViewController") as! DetailCharacterViewController
        desVC.Image = charactersImage[indexPath.row]
        desVC.name = characters[indexPath.row]
        self.navigationController?.pushViewController(desVC, animated: true)
    }


}

