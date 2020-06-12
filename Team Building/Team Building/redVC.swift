	//
//  redVC.swift
//  Team Building
//
//  Created by Bucataru Cristian on 5/11/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import Foundation
import UIKit

class redVC: UIViewController {
    var blueNum = 0
    var redNum = 0
    var values: NSArray = []
    var blueCounts: Float?
    var redCounts: Float?
    var screenWidth: CGFloat?
    //MARK: Outlets
    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var redTeamPg: UIImageView!
    @IBOutlet weak var blueTeamPg: UIImageView!
    
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = UIScreen.main.bounds.width
        get()
        updateRedTeam()
        updateBlueTeam()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateBlueTeam(){
        var blueTeamXFloat: Float?
        if screenWidth! == 375{
        blueTeamXFloat = Float(20 + (Int(blueCounts!) * 313) / 100000)
        }
        else if screenWidth! < 375 {
            blueTeamXFloat = Float(20 + (Int(blueCounts!) * 260) / 100000)
        }
        else if screenWidth! > 375 {
            blueTeamXFloat = Float(20 + (Int(blueCounts!) * 354) / 100000)
        }
        blueTeamXFloat!.round()
        blueTeamPg.frame = CGRect(x: Int(blueTeamXFloat!), y: 9, width: 15, height: 30)
    }
    func updateRedTeam(){
        var redTeamXFloat: Float?
        if screenWidth! == 375{
            redTeamXFloat = Float(20 + (Int(redCounts!) * 313) / 100000)
        }
        else if screenWidth! < 375 {
            redTeamXFloat = Float(20 + (Int(redCounts!) * 260) / 100000)
        }
        else if screenWidth! > 375 {
            redTeamXFloat = Float(20 + (Int(redCounts!) * 354) / 100000)
        }
        
        redTeamXFloat!.round()
        redTeamPg.frame = CGRect(x: Int(redTeamXFloat!), y: 56, width: 15, height: 30)
    }
    func get(){
        let url = NSURL(string: "https://www.esportsacademy.ro/TeamBuilding/get.php")
        let data = NSData(contentsOf: url! as URL)
        values = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        let maindata = values[0] as! [String: Any]
        let blueCountsString = maindata["bluePresses"] as! String
        blueCounts = Float(blueCountsString)
        let redCountsString = maindata["redPresses"] as! String
        redCounts = Float(redCountsString)
        
        if redCounts! >= 1000 {
            let redCountsCopy: Float = redCounts! / 1000
            var myStringToTwoDecimals = String(format:"%.2f", redCountsCopy)
            myStringToTwoDecimals += "K"
            redText.text = myStringToTwoDecimals
        }
        else {
            redText.text = maindata["redPresses"] as? String
        }
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    //MARK: Actions
    @IBAction func redButton(_ sender: UIButton) {
        
        //put the link of the php file here. The php file connects the mysql and swift
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.esportsacademy.ro/TeamBuilding/red.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=qwerty"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
        get()
        updateRedTeam()
        updateBlueTeam()
    }
}

