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

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

enum PlayerClass: String {
    case zombi = "Zombi"
    case ninja = "Ninja"
    case adventurer = "Adventurer"
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
    let profession: PlayerClass
    //let skillsPoints: [Skills: Int]
    
    var lifePoint: Int
    
    /// Initialize an Human
    /// - Parameter name: human's name
    /// - Parameter surname: human's surname
    /// - Parameter lifePoint: human's lifePoint - default 20pts
    /// - Parameter skills: list of human skillsPoint
    init(name:String, surname: String,gender: Gender , lifePoint: Int = 20, profession: PlayerClass) {
        self.name       = name
        self.surname    = surname
        self.gender     = gender
        self.lifePoint  = lifePoint
        self.profession = profession
    }
    
    
    /// get human profession in string
    public func getProfessionString() -> String {
        return self.profession.rawValue
    }
    
    
    /// get human gender in string
    public func getGenderString() -> String {
        return self.gender.rawValue
    }
}
