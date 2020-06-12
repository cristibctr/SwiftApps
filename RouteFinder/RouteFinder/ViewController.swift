//
//  ViewController.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/17/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createNewRoute(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Route name", message: "You need to type the name of your route:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0] as? UITextField {
                // store your data
                
            } else {
                // user did not fill field
                
            }
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
