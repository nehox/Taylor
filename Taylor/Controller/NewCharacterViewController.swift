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
    private func getGender() -> Gender {
        switch genderSegmentedController.selectedSegmentIndex {
        case 0:
            return .male
        case 1:
            return .female
        default:
            return .other
        }
    }
    
    
    /// get current class
    private func getCharacterClass() -> PlayerClass {
        switch classSegmentedController.selectedSegmentIndex {
        case 0:
            return .zombi
        case 1:
            return .adventurer
        case 2:
            return .ninja
        default:
            return .zombi
        }
    }
    
    /// change class preview
    /// - Parameter gender: male / female / other
    /// - Parameter playerClass: thief / magician / archer
    private func changeImageViewCharacter(gender : Gender, playerClass: PlayerClass) {
        
        var genderStr = ""
        
        switch gender {
            case .male:
                genderStr = "Male"
                break
            case .female:
                genderStr = "Female"
                break
            case .other:
                genderStr = "Other"
                break
        }
        
        switch playerClass {
            case .zombi:
                self.imageView.loadGif(asset: "Zombi_\(genderStr)")
                break
            case .adventurer:
                self.imageView.loadGif(asset: "Adventurer_\(genderStr)")
                break
            case .ninja:
                self.imageView.loadGif(asset: "Ninja_\(genderStr)")
                break
        }
    }
    
    // MARK: -- Outlets actions --
    
    @IBAction func saveButton(_ sender: Any) {
        
        switch classSegmentedController.selectedSegmentIndex {
        case 0:
            _ = Zombi(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        case 1:
            _ = Adventurer(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        case 2:
            _ = Ninja(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        default:
            _ = Human(name: "John", surname: "Doe", gender: .other)
        }
    }
    
    @IBAction func genderSelectControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter(gender: getGender(), playerClass: getCharacterClass())
    }
    @IBAction func classSegmentedControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter(gender: getGender(), playerClass: getCharacterClass())
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
