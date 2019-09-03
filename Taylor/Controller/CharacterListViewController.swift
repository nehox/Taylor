//
//  CharacterListViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 03/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController {
    
    var listCharacters = [Human]()
    
    @IBOutlet weak var listCharacterTableView: UITableView!
    
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func closeViewButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension CharacterListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "coucou"
        
        return cell
    }
    
}
