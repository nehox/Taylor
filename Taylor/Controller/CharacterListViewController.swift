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
        listCharacterTableView.register(UINib(nibName: "CharacterCell",bundle: nil), forCellReuseIdentifier: "CharacterCell")
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
                                                gender: getGender(gender: player.gender ?? ""),
                                                profession: PlayerClass.zombi)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        if (listCharacters.count == 0 ){
            self.initData()
        }
        
        cell.characterePreviewImageView.loadGif(asset: "\(listCharacters[indexPath.row].getProfessionString())_\(listCharacters[indexPath.row].getGenderString())")
        cell.surnameLabel.text = listCharacters[indexPath.row].surname
        cell.nameLabel.text = listCharacters[indexPath.row].name
        cell.classLabel.text = listCharacters[indexPath.row].getProfessionString()
        
        return cell
    }
    
}
