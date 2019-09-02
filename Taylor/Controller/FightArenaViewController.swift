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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create player as Human
        let player = Archer(name: "John", surname: "Doe", gender: .male, weapon: Weapon(type: .melee, damage: 20))
        
        //create monster as Zombi
        let monster = Zombi()
        
        
        //do fight
        round(player: player, monster: monster)
        round(player: player, monster: monster)
        round(player: player, monster: monster)
        
        //regen human
        player.eat()
        player.eat()
        player.eat()
        
        //finish fight
        round(player: player, monster: monster)
        round(player: player, monster: monster)
    }
    
    
    /// do a round
    /// - Parameter player: Human
    /// - Parameter monster: Zombi
    func round(player: Human, monster: Zombi) {
     
        switch player  {
            case is Archer:
                monster.lifePoint -= (player as! Archer).weapon?.damage ?? 10
                break
            case is Magician:
                monster.lifePoint -= (player as! Magician).weapon?.damage ?? 10
                break
            case is Thief:
                monster.lifePoint -= (player as! Thief).weapon?.damage ?? 10
                break
            default:
                print("not possible ! ")
        }
        
        
        if monster.lifePoint <= 0 {
            print("Zombi died")
        } else {
            player.lifePoint -= monster.damage
        }
        
        print("Zombi life : \(monster.lifePoint)\nPlayer life : \(player.lifePoint)")
        
        
    }
}
