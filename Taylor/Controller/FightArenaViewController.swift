//
//  FightArenaViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 02/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit

class FightArenaViewController: UIViewController {
    
    var player: Human = Human.getAllHumans()[Int.random(in: 0...Human.getAllHumans().count)]
    var monster: Monster?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("player is : \(player.name) \(player.surname) \(player.getProfessionString())")
        
    }
    
    
    /// do a round
    /// - Parameter player: Human
    /// - Parameter monster: Zombi
    func round(player: Human, monster: Monster) {
     
        switch player  {
            case is Zombi:
                monster.lifePoint -= (player as! Zombi).weapon?.damage ?? 10
                break
            case is Adventurer:
                monster.lifePoint -= (player as! Adventurer).weapon?.damage ?? 10
                break
            case is Ninja:
                monster.lifePoint -= (player as! Ninja).weapon?.damage ?? 10
                break
            default:
                print("not possible ! ")
        }
        
        
        if monster.lifePoint <= 0 {
            print("Monster died")
        } else {
            player.lifePoint -= monster.damage
        }
        
        print("Monster life : \(monster.lifePoint)\nPlayer life : \(player.lifePoint)")
        
        
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
