//
//  FirstViewController.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/21/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //Variables
    var timer: Timer?
    var counter = 0
    var startTime: Double?
    var startTimeInterval: Double = 0
    var totalSec: Int = 0
    var secondInterval: Double?
    var thirdInterval: Double?
    //MARK: Action
    
    @IBAction func startButton(_ sender: UIButton) {
        if startTimeInterval == 0 {
            var currentTime = NSDate()
            let interval = currentTime.timeIntervalSince1970
        }
        startTime = NSDate.timeIntervalSinceReferenceDate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        secondInterval = appDelegate.Interval2
        thirdInterval = appDelegate.Interval3
        if timer == nil{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stopButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        totalSec = 0
        startTimeInterval = 0
        countingLabel.text = "00:00:00"
    }
    @IBAction func pauseButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
    }
    //MARK: Outlet
    
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.tabBar.layer.borderWidth = 0.50
        self.tabBarController!.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.gray.cgColor, UIColor.lightGray.cgColor]
        newLayer.frame = view.frame
        newLayer.locations = [0.8 , 0.90]
        
        view.layer.insertSublayer(newLayer, at: 0)

        stopButton.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        startButton.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        pauseButton.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func UpdateTimer(){
        totalSec += 1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if totalSec < appDelegate.getThatValue{
            totalSec = appDelegate.getThatValue
        }
        countingLabel.text = String(totalSec)
        var totalSecMulti100: Int = Int(totalSec)
        var min = Int(totalSec/60)
        let hour = Int(min/60)
        if min > 59 {
            min = min % 60
        }
        if §    totalSecMulti100 > 59 {
            totalSecMulti100 = totalSec % 60
        }

        var minStr = (min == 0) ? "00" : "\(min)"
        let hourStr = (hour == 0) ? "00" : "\(hour)"
        var secStr = (totalSec <= 9) ? "0\(totalSecMulti100)" : "\(totalSecMulti100)"

        countingLabel.text = "\(hourStr):\(minStr):\(secStr)"
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
