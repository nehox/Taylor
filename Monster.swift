//
//  Zombie.swift
//  Taylor
//
//  Created by Julien Ficerai on 02/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation

class Monster {
    
    var lifePoint: Int
    let damage: Int
    let hitChance: Int
    
    /// initialize zombi
    ///
    /// - Parameters:
    ///   - lifePoint: number of life point
    ///   - damage: damage per hit
    ///   - hitChance: chance to hit in percent
    init(lifePoint: Int = 100, damage: Int = 10, hitChance: Int = 80) {
        self.lifePoint = lifePoint
        self.damage = damage
        self.hitChance = hitChance
    }
}
