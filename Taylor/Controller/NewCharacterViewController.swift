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
    
    @IBOutlet weak var genderSegmentedController: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classSegmentedController: UISegmentedControl!
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderSegmentedController.selectedSegmentIndex = 0
        classSegmentedController.selectedSegmentIndex = 2
        self.imageView.loadGif(asset: "Thief_Male")
        
    }
    @IBAction func saveButton(_ sender: Any) {
        
        var perso: Human
        
        switch classSegmentedController.selectedSegmentIndex {
        case 0:
            perso = Archer(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        case 1:
            perso = Magician(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        case 2:
            perso = Thief(name: nameTexField.text ?? "", surname: surnameTextField.text ?? "", gender: getGender(), weapon: nil)
        default:
            perso = Human(name: "John", surname: "Doe", gender: .other, skillsPoints: [:])
        }
        
        print("nouveau perso : \nnom : \(perso.name)\nprenom : \(perso.surname)\nclass : \(String(describing: perso))\ngender : \(perso.gender)")
        
    }
    
    
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
            return .archer
        case 1:
            return .magician
        case 2:
            return .thief
        default:
            return .archer
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
            case .archer:
                self.imageView.loadGif(asset: "Archer_\(genderStr)")
                break
            case .magician:
                self.imageView.loadGif(asset: "Magician_\(genderStr)")
                break
            case .thief:
                self.imageView.loadGif(asset: "Thief_\(genderStr)")
                break
        }
    }
    
    
    @IBAction func genderSelectControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter(gender: getGender(), playerClass: getCharacterClass())
    }
    @IBAction func classSegmentedControllerChanged(_ sender: Any) {
        self.changeImageViewCharacter(gender: getGender(), playerClass: getCharacterClass())
    }
}
