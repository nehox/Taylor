//
//  CharacterListViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 03/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CharacterListViewController: UIViewController {
    
    var listCharacters = [Human]()
    
    @IBOutlet weak var listCharacterTableView: UITableView!
    
    override func viewDidLoad() {
        initData()
        
    }
    
    
    @IBAction func closeViewButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func initData(){
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
                                                gender: getGender(gender: player.gender ?? ""))
                                       )
                    
                }
            }
            
        } catch {
            print("Ooups on a pas vraiment reussi a récup les players ...")
        }
    }
    
    private func getGender(gender: String) -> Gender {
        switch gender {
        case "Male":
            return .male
        case "Female":
            return .female
        default:
            return .other
        }
    }
}

extension CharacterListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = listCharacters[indexPath.row].name
        
        return cell
    }
    
}
