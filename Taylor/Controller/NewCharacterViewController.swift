//
//  NewCharacterViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 30/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit
import SwiftGifOrigin

class NewCharacterViewcontroller: UIViewController {
    
    // MARK: -- Outlets --
    
    @IBOutlet weak var genderSegmentedController: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classSegmentedController: UISegmentedControl!
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    // MARK: -- UIViewController override --
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderSegmentedController.selectedSegmentIndex = 0
        classSegmentedController.selectedSegmentIndex = 0
        self.imageView.loadGif(asset: "Zombi_Male")
        
    }
    
    // MARK: -- private functions --
    
    /// get current selected gender
    private func getGender() -> String {
        switch genderSegmentedController.selectedSegmentIndex {
        case 0:
            return "Male"
        case 1:
            return "Female"
        default:
            return "Other"
        }
    }
    
    
    /// get current class
    private func getCharacterClass() -> String {
        switch classSegmentedController.selectedSegmentIndex {
        case 0:
            return "Zombi"
        case 1:
            return "Adventurer"
        case 2:
            return "Ninja"
        default:
            return "Other"
        }
    }
    
    /// change class preview
    private func changeImageViewCharacter() {
        self.imageView.loadGif(asset: "\(getCharacterClass())_\(getGender())")
    }
    
    // MARK: -- Outlets actions --
    
    @IBAction func saveButton(_ sender: Any) {
        
        let player = Player(context: AppDelegate.viewContext)
        
        player.name = nameTexField.text ?? ""
        player.surname = surnameTextField.text ?? ""
        player.gender = getGender()
        player.playerClass = getCharacterClass()
        player.lifePoint = 100
        
        do {
            try AppDelegate.viewContext.save()
            print("save Ok")
        }catch {
           print("oups fail")
        }
    }
    
    @IBAction func genderSelectControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter()
    }
    @IBAction func classSegmentedControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter()
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
