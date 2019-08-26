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

public class Human {
    
    var name: String
    var surname: String
    var lifePoint: Int
    var skillsPoints: [Skills: Int]
    
    /// Initialize an Human
    /// - Parameter name: human's name
    /// - Parameter surname: human's surname
    /// - Parameter lifePoint: human's lifePoint - default 20pts
    /// - Parameter skills: list of human skillsPoint
    init(name:String, surname: String, lifePoint: Int = 20, skillsPoints: [Skills: Int]) {
        self.name      = name
        self.surname   = surname
        self.lifePoint = lifePoint
        self.skillsPoints    = skillsPoints
    }
    
    public func walk(){}
    public func eat(){}
    public func sleep(){}
    
}
