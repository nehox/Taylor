//
//  ViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        var listePlayer = [Human]()
        
        listePlayer.append(Zombi(name: "John", surname: "Z", gender: .male, weapon: Weapon(type: .melee, damage: 20)))
        listePlayer.append(Adventurer(name: "John", surname: "Adventurer", gender: .male, weapon: Weapon(type: .melee, damage: 20)))
        
        listePlayer.append(Ninja(name: "John", surname: "Ninja", gender: .male, weapon: Weapon(type: .melee, damage: 20)))
        
        let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: listePlayer, requiringSecureCoding: true)
        
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(encodedData, forKey: "listPlayer")
    }
}

