//
//  Weapons.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation

enum Type {
    case melee
    case distance
    case magic
}

public class Weapons {
    
    let type: Type
    let damage: Int
    
    init(type: Type, damage: Int) {
        self.type = type
        self.damage = damage
    }
}
