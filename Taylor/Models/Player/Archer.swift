//
//  Archer.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation


public class Archer: Human {
    
    var weapon: Weapon?
    
    init(name: String, surname: String, gender: Gender, weapon: Weapon? ) {
        super.init(name: name, surname: surname, gender: gender, lifePoint: 100, skillsPoints: [
            .speed : 15,
            .intelligence: 10,
            .agility: 25])
        self.weapon = weapon
    }
}

extension Archer: HumanProtocol {
    
    func walk() {
        
    }
    
    func eat() {
        
    }
    
    func sleep() {
        
    }
    
    func fight() {
        
    }
}
