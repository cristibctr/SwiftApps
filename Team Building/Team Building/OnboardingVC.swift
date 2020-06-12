//
//  OnboardingVC.swift
//  Team Building
//
//  Created by Bucataru Cristian on 5/11/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import Foundation
import UIKit

class OnboardingVC: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    @IBAction func chooseRedTeam(_ sender: UIButton) {
        UserDefaults.standard.set("red", forKey: "team")
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    @IBAction func chooseBlueTeam(_ sender: UIButton) {
        UserDefaults.standard.set("blue", forKey: "team")
        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    
    
}
