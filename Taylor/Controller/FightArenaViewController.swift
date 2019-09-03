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
        let player = Zombi(name: "John", surname: "Doe", gender: .male, weapon: Weapon(type: .melee, damage: 20))
        
        //create monster as Zombi
        let monster = Monster()
        
        
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
            print("Zombi died")
        } else {
            player.lifePoint -= monster.damage
        }
        
        print("Zombi life : \(monster.lifePoint)\nPlayer life : \(player.lifePoint)")
        
        
    }
}
