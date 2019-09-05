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
        listCharacters = Human.getAllHumans()
        listCharacterTableView.register(UINib(nibName: "CharacterCell",bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }
    
    @IBAction func closeViewButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension CharacterListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.characterePreviewImageView.loadGif(asset: "\(listCharacters[indexPath.row].getProfessionString())_\(listCharacters[indexPath.row].getGenderString())")
        cell.surnameLabel.text = listCharacters[indexPath.row].surname
        cell.nameLabel.text = listCharacters[indexPath.row].name
        cell.classLabel.text = listCharacters[indexPath.row].getProfessionString()
        
        return cell
    }
    
}
