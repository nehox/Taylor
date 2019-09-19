//
//  MonsterManager.swift
//  Taylor
//
//  Created by Julien Ficerai on 19/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit


struct MonsterApi: Codable {
    let name: String?
    let strength: Int?
    
}

class MonsterManager {
    
    
    static func getRandomMonster() -> Promise<Monster> {
        return Promise { seal in
            Alamofire.request("http://dnd5eapi.co/api/monsters/\(Int.random(in: 1...325))").response { (response) in
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let monsterApi = try decoder.decode(MonsterApi.self, from: data)
                    
                    if let lifePoint = monsterApi.strength {
                        seal.fulfill(Monster(lifePoint: lifePoint*10, damage: Int.random(in: 1...15), hitChance: 80))
                    }
                    
                } catch let error {
                    print(error)
                }
            }
        }
    }
}
