//
//  secondViewController.swift
//  time
//
//  Created by DrMac on 4/1/15.
//  Copyright (c) 2015 DrMac. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

   
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var displaySTimeText: UILabel!
    var displaySTText: String = ""
    var chosenTime = NSDate()
    
    @IBOutlet weak var introTimeDisplay: UILabel!
    
    @IBOutlet weak var prepSpeechDisplay: UILabel!
    var numSpeak: String = ""
    
    @IBOutlet weak var tableTopTimeDisplay: UILabel!
    @IBOutlet weak var evalTimeDisplay: UILabel!
    @IBOutlet weak var awardsTimeDisplay: UILabel!
   
    @IBOutlet weak var displayTimeLabel: UILabel!
  
    var timer = NSTimer()
    var elapsedTime = NSTimeInterval()
    var startTimeDate = NSDate()
    var elapsedTimeDate = NSDate()
    
    @IBAction func start(sender: AnyObject) {
        if !timer.valid {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTimeDate = NSDate()
            startTime = NSDate.timeIntervalSinceReferenceDate() + elapsedTime
            startButton.setTitle("Pause", forState: UIControlState.Normal)
        } else {
            startButton.setTitle("Continue", forState: UIControlState.Normal)
            elapsedTime += startTimeDate.timeIntervalSinceNow
            timer.invalidate()
        }
    }
    @IBAction func stop(sender: AnyObject) {
        elapsedTime = 0
        if timer.valid {
            startButton.setTitle("Start", forState: UIControlState.Normal)
            timer.invalidate()
        } else {
            displayTimeLabel.text = "00:00:00"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displaySTimeText.text = displaySTText
        
            }
    
    var startTime = NSTimeInterval()
    
    func updateTime() {
    var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
    //
    var elapsedTime: NSTimeInterval = currentTime-startTime
       
    //calculate the minutes in elapsed time.
        
    let minutes = UInt8(elapsedTime / 60.0)
    elapsedTime -= (NSTimeInterval(minutes) * 60)
    
    //calculate the seconds in elapsed time.
        
    let seconds = UInt8(elapsedTime)
    elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction): "0" + String(fraction)
        
        
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        var test = "\(strMinutes):\(strSeconds):\(strFraction)"
        // displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
       
        
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
