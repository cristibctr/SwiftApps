//
//  start.swift
//  Team Building
//
//  Created by Bucataru Cristian on 5/11/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import Foundation
import UIKit

class start: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    @IBAction func startButton(_ sender: UIButton) {
        if (UserDefaults.standard.value(forKey: "team") as? String) == "blue" {
            // Switch to blue VC
            let vc = storyboard?.instantiateViewController(withIdentifier: "blueTeam")
            self.present(vc!, animated: true)
        }
        else{
            // Switch to red VC
            let vc = storyboard?.instantiateViewController(withIdentifier: "redTeam")
            self.present(vc!, animated: true)

        }
    }
    
}
