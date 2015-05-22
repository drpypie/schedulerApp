//
//  ViewController.swift
//  time
//
//  Created by DrMac on 4/1/15.
//  Copyright (c) 2015 DrMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var startTimeDisplay: UILabel!
   // @IBOutlet weak var startTimeDisplay: UITextField!
    @IBOutlet weak var numSpeakers: UITextField!
    @IBOutlet weak var ancmt: UISegmentedControl!
    @IBOutlet weak var humorist: UISegmentedControl!
    @IBOutlet weak var intermission: UISegmentedControl!
    @IBAction func create(sender: AnyObject) {
    }
    //@IBOutlet weak var intermission: UISegmentedControl!
    
     func timePicker(){
    
    startTime.datePickerMode = UIDatePickerMode.Time
    
    }

    
    
    @IBAction func timePickerClicked(sender: UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        var dateStr = dateFormatter.stringFromDate(startTime.date)
        let sttime = dateStr
        startTimeDisplay.text = dateStr
    }
    
    /*let calendar = NSCalendar.currentCalendar()
    let date = calendar.dateByAddingUnit(.CalendarUnitMinute, value: 5, toDate: startTimeDisplay, options: nil)*/
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            numSpeakers.delegate = self
            timePicker()
            }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        numSpeakers.resignFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : secondViewController = segue.destinationViewController as secondViewController
        
      DestViewController.displaySTText = startTimeDisplay.text!
        DestViewController.numSpeak = numSpeakers.text
        DestViewController.chosenTime = startTime.date
    /*    let intro = startTimeDate.dateByAddingTimeInterval(5.0 * 60.0)
        DestViewController.introTimeDisplay*/
            }

   
}



