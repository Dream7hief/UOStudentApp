//
//  AddCourseViewController.swift
//  UO Student
//
//  Created by Logan Poole on 12/3/17.
//  Copyright © 2017 Logan Poole. All rights reserved.
//


import UIKit
import CoreData

class AddCourseViewController: UIViewController{
    //MARK: Properties
    var delegate:AddCourseViewControllerDelegate? = nil
    
    //MARK: IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startTimeText: UITextField!
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        //saveCourse()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
         let _ = navigationController?.popViewController(animated: true)
    }
    
    /*func saveCourse() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let course = Course(context: context) // Link Course & Context
        course.name = nameTextField.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss.SSSSxxx"
        /* date_format_you_want_in_string from
          http://userguide.icu-project.org/formatparse/datetime
         */
        course.start = dateFormatter.date(from: startTimeText.text!)
        course.end = dateFormatter.date(from: endTimeText.text!)
        for _ in swtchCollection {
            let _ = SwitchState(context: context) // Link SwitchState & Context
        }
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
    }*/
 
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
