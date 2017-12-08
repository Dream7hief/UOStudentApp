//
//  Day+CoreDataProperties.swift
//  
//
//  Created by Logan Poole on 12/7/17.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var name: String?
    @NSManaged public var busy: Bool
    @NSManaged public var orderIndex: Int16
    @NSManaged public var courseDays: Course?
    @NSManaged public var officeDays: Instructor?

}
