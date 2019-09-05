//
//  Human.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import CoreData


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
    
    
    /// get gender Type  enum
    /// - Parameter gender: gender of human
    static func getGender(gender: String) -> Gender {
        switch gender {
        case "Male":
            return .male
        case "Female":
            return .female
        default:
            return .other
        }
    }
    
    
    /// get all human save in coreData
    static func getAllHumans() -> [Human]{
        
        var listCharacters = [Human]()
        
        do {
            let request: NSFetchRequest<Player> = Player.fetchRequest()
            let players = try AppDelegate.viewContext.fetch(request)
            
            for player in players {
                switch player.playerClass {
                case "Adventurer":
                    listCharacters.append(Adventurer(name: player.name ?? "",
                                                     surname: player.surname ?? "",
                                                     gender: getGender(gender: player.gender ?? ""),
                                                     weapon: nil)
                    )
                    break
                case "Ninja":
                    listCharacters.append(Ninja(name: player.name ?? "",
                                                surname: player.surname ?? "",
                                                gender: getGender(gender: player.gender ?? ""),
                                                weapon: nil)
                                       )
                    break
                case "Zombi":
                    listCharacters.append(Zombi(name: player.name ?? "",
                                                surname: player.surname ?? "",
                                                gender: getGender(gender: player.gender ?? ""),
                                                weapon: nil)
                                       )
                    break
                default:
                    listCharacters.append(Human(name: player.name ?? "",
                                                surname: player.surname ?? "",
                                                gender: getGender(gender: player.gender ?? ""),
                                                profession: PlayerClass.zombi)
                                       )
                }
            }
            
        } catch {
            print("Ooups on a pas vraiment reussi a récup les players ...")
        }
        
        return listCharacters
    }
}
