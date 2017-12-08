//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Logan Poole on 12/7/17.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var due_date: NSDate?
    @NSManaged public var course: Course?

}
