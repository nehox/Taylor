//
//  Human.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation


/// Human Skills
enum Skills {
    case speed
    case agility
    case intelligence
}

enum Gender {
    case male
    case female
    case other
}

enum PlayerClass {
    case archer 
    case thief
    case magician
}

protocol HumanProtocol {
    func eat()
    func sleep()
    func fight()
}

public class Human {
    
    let name: String
    let surname: String
    let gender: Gender
    let skillsPoints: [Skills: Int]
    
    var lifePoint: Int
    
    /// Initialize an Human
    /// - Parameter name: human's name
    /// - Parameter surname: human's surname
    /// - Parameter lifePoint: human's lifePoint - default 20pts
    /// - Parameter skills: list of human skillsPoint
    init(name:String, surname: String,gender: Gender , lifePoint: Int = 20, skillsPoints: [Skills: Int]) {
        self.name      = name
        self.surname   = surname
        self.gender    = gender
        self.lifePoint = lifePoint
        self.skillsPoints = skillsPoints
    }
}
