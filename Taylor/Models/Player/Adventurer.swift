//
//  Magician.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation

public class Adventurer: Human {
    
   var weapon: Weapon?
    
    init(name: String, surname: String, gender: Gender, weapon: Weapon? ) {
        super.init(name: name, surname: surname, gender: gender, lifePoint: 100, skillsPoints: [
            .speed : 15,
            .intelligence: 25,
            .agility: 10])
        self.weapon = weapon
    }
}

extension Adventurer: HumanProtocol {

    func eat() {
        if (self.lifePoint < 95) {
            self.lifePoint += 5
        }
    }
    
    func sleep() {
        
    }
    
    func fight() {
        
    }
}
