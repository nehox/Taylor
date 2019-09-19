//
//  ScenarioViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 06/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit

class ScenarioViewController: UIViewController {
    
    @IBOutlet weak var fightButton: UIButton!
    @IBOutlet weak var roundString: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var monsterHpLabel: UILabel!
    
    var player:Human = Human.getAllHumans()[0]
    var monster:Monster = Monster(lifePoint: 100, damage: 12, hitChance: 80)
    var round:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerHpLabel.text = self.player.lifePoint.description
        
        _ = MonsterManager.getRandomMonster().done { (monster) in
            self.monster = monster
            self.monsterHpLabel.text = self.monster.lifePoint.description
        }
        

    }
    
    @IBAction func FightButton(_ sender: Any) {
        if(playerIsDied()) {
            _ = MonsterManager.getRandomMonster().done { (monster) in
                self.monster = monster
                self.monsterHpLabel.text = self.monster.lifePoint.description
                self.player.lifePoint = 100
                self.playerHpLabel.text = self.player.lifePoint.description
            }
        } else {
            round(player: player, monster: monster)
        }
        
    }
    
    
    private func playerFight() {
        
        switch self.player  {
           case is Zombi:
            self.monster.lifePoint -= (player as! Zombi).weapon?.damage ?? 10
               break
           case is Adventurer:
            self.monster.lifePoint -= (player as! Adventurer).weapon?.damage ?? 10
               break
           case is Ninja:
            self.monster.lifePoint -= (player as! Ninja).weapon?.damage ?? 10
               break
           default:
               print("not possible ! ")
       }
        
        if self.isMonsterDied() {
          print("Monster died")
        }
        
        
    }
    
    private func isMonsterDied() -> Bool {
        return (self.monster.lifePoint <= 0)
    }
    
    private func playerIsDied() -> Bool {
        return (self.player.lifePoint <= 0)
    }
    
    private func monsterFight(){
        self.player.lifePoint -= self.monster.damage
    }
    
    
    
    /// do a round
    /// - Parameter player: Human
    /// - Parameter monster: Zombi
    func round(player: Human, monster: Monster) {
     
        if !playerIsDied() {
            playerFight()
        } else {
            
        }
        
        if !isMonsterDied() {
            monsterFight()
        }
        
        self.monsterHpLabel.text = self.monster.lifePoint.description
        self.playerHpLabel.text = self.player.lifePoint.description
        
    }
}
