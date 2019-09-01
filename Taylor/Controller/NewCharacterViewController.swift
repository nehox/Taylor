//
//  NewCharacterViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 30/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation
import UIKit

class NewCharacterViewcontroller: UIViewController {
    
    @IBOutlet weak var genderSegmentedController: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classSegmentedController: UISegmentedControl!
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
