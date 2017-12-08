//
//  DailyViewController.swift
//  UO Student
//
//  Created by Logan Poole on 12/3/17.
//  Copyright © 2017 Logan Poole. All rights reserved.
//


import CoreData
import UIKit

class DailyViewController: UIViewController {
    // MARK: Properties (IBOutlet)
    @IBOutlet private weak var dailyListTable: UITableView!
    // MARK: Properties (Private)
    //private var courseFetchedResultsController: NSFetchedResultsController<Course>!
    private let duckGreen = UIColor(red: 11, green: 93, blue: 63)
    private let duckGold  = UIColor(red: 251, green: 229, blue: 116)
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //courseFetchedResultsController = CourseService.shared.getCourses()
        //courseFetchedResultsController.delegate = self
    }
    
    func toggleDaySelect(label dayLabel: UILabel, _ selected: Bool) {
        if selected == true {
            // Set background.
            dayLabel.backgroundColor = duckGreen
            
            // Set foreground.
            dayLabel.textColor = duckGold
        }
        else {
            // Set background.
            dayLabel.backgroundColor = duckGold
            
            // Set foreground.
            dayLabel.textColor = duckGreen
        }
    }
    
}
extension DailyViewController: UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return courseFetchedResultsController.sections?.first?.numberOfObjects ?? 0
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayViewCell", for: indexPath) as?
            TodayViewCell else {return UITableViewCell()}
        
//        let course = courseFetchedResultsController.object(at: indexPath)
//        cell.className.text = course.name
//        cell.startTime.text = String(course.startTime)
//        cell.endTime.text = String(course.endTime)
        //        for dayLabel in cell.week {
        //            toggleDaySelect(label: dayLabel, classDays[dayLabel.text!]!)
        //        }
        
        return cell
        
    }
    // MARK: NSFetchedResultsController
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // For more dynamic applications it is more appropriate to implement the other delegate methods
        // to do more fine-grained updates.  In simple cases this can be appropriate.
        dailyListTable.reloadData()
    }
}

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

