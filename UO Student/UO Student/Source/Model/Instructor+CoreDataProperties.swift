//
//  Instructor+CoreDataProperties.swift
//  
//
//  Created by Logan Poole on 12/7/17.
//
//

import Foundation
import CoreData


extension Instructor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instructor> {
        return NSFetchRequest<Instructor>(entityName: "Instructor")
    }

    @NSManaged public var first: String?
    @NSManaged public var last: String?
    @NSManaged public var email: String?
    @NSManaged public var start_office: NSDate?
    @NSManaged public var end_office: NSDate?
    @NSManaged public var officeBuilding: Building?
    @NSManaged public var courses: NSSet?
    @NSManaged public var officeDays: Day?

}

// MARK: Generated accessors for courses
extension Instructor {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}
