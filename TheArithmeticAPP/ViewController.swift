
//
//  ViewController.swift
//  The ARITMETic APP
//
//  Created by student on 2/13/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activity: UITextField!
    //@IBOutlet weak var activity: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var excerciseTime: UITextField!
    
    @IBOutlet weak var energy: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var selectedActivity : String?
    @IBAction func calculate(_ sender: Any) {
        //let activity1 = activity.text!
        let weight1 : Double? = Double(weight.text!)
        let exerciseTime1 : Int? = Int(excerciseTime.text!)
        
        if weight1 != nil && exerciseTime1 != nil && (selectedActivity != nil && selectedActivity != "Select Activity")
        {
            warningsLBL.text = ""
            let exTime = ExerciseCoach.energyConsumed(during: selectedActivity!, weight: weight1!, time: exerciseTime1!)
            let getTime = ExerciseCoach.timeToLose1Pound(during: selectedActivity!, weight: weight1!)
            
            energy.text = String(format:"%.1f",exTime)+" "+"cal"
            time.text = String(format:"%.1f",getTime)+" "+"minutes"
        }
        else if(selectedActivity == "Select Activity" || selectedActivity == "" || selectedActivity == nil)
        {
            warningsLBL.text = "Please enter valid activity"
            
        }
        else if(weight1 == nil || weight1! < 0.0)
        {
            warningsLBL.text = "Please enter valid weight"
            
        }
        else if (exerciseTime1 == nil || exerciseTime1! < 0){
            warningsLBL.text = "Please enter valid time"
            
        }
    }
    
    @IBOutlet weak var warningsLBL: UILabel!
 
    
    @IBAction func clear(_ sender: Any) {
        warningsLBL.text = ""
        activity.text = ""
        weight.text = ""
        excerciseTime.text = ""
        energy.text = "0 cal"
        time.text = "0 minutes"
        selectedActivity = ""
    }
    
    
    let activities1 = ["Select Activity","Bicycling","Jumping Rope","Running - slow","Running - fast","Tennis","Swimming"]
    
    
    func createActivityList() {
        let activityList = UIPickerView()
        activityList.delegate = self
        activity.inputView = activityList
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createActivityList()
        
    }
    
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities1.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activities1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedActivity = activities1[row]
        activity.text = selectedActivity
    }
}





