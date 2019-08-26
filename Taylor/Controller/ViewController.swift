//
//  ViewController.swift
//  Taylor
//
//  Created by Julien Ficerai on 26/08/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate func extractedFunc() -> Human {
        return Human(name: "Steve", surname: "Jobs", gender: Gender.male ,lifePoint: 120, skillsPoints: [
            Skills.speed : 20,
            Skills.intelligence: 25,
            Skills.agility : 5])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let steveJobs = extractedFunc()
    }
}

