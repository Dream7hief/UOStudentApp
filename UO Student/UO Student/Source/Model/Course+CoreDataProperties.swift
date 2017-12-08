//
//  Course+CoreDataProperties.swift
//  
//
//  Created by Logan Poole on 12/7/17.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var title: String?
    @NSManaged public var sub_title: String?
    @NSManaged public var start: NSDate?
    @NSManaged public var end: NSDate?
    @NSManaged public var courseDays: NSOrderedSet?
    @NSManaged public var courseInstructor: Instructor?
    @NSManaged public var courseBuilding: Building?
    @NSManaged public var courseTasks: NSSet?

}

// MARK: Generated accessors for courseDays
extension Course {

    @objc(insertObject:inCourseDaysAtIndex:)
    @NSManaged public func insertIntoCourseDays(_ value: Day, at idx: Int)

    @objc(removeObjectFromCourseDaysAtIndex:)
    @NSManaged public func removeFromCourseDays(at idx: Int)

    @objc(insertCourseDays:atIndexes:)
    @NSManaged public func insertIntoCourseDays(_ values: [Day], at indexes: NSIndexSet)

    @objc(removeCourseDaysAtIndexes:)
    @NSManaged public func removeFromCourseDays(at indexes: NSIndexSet)

    @objc(replaceObjectInCourseDaysAtIndex:withObject:)
    @NSManaged public func replaceCourseDays(at idx: Int, with value: Day)

    @objc(replaceCourseDaysAtIndexes:withCourseDays:)
    @NSManaged public func replaceCourseDays(at indexes: NSIndexSet, with values: [Day])

    @objc(addCourseDaysObject:)
    @NSManaged public func addToCourseDays(_ value: Day)

    @objc(removeCourseDaysObject:)
    @NSManaged public func removeFromCourseDays(_ value: Day)

    @objc(addCourseDays:)
    @NSManaged public func addToCourseDays(_ values: NSOrderedSet)

    @objc(removeCourseDays:)
    @NSManaged public func removeFromCourseDays(_ values: NSOrderedSet)

}

// MARK: Generated accessors for courseTasks
extension Course {

    @objc(addCourseTasksObject:)
    @NSManaged public func addToCourseTasks(_ value: Task)

    @objc(removeCourseTasksObject:)
    @NSManaged public func removeFromCourseTasks(_ value: Task)

    @objc(addCourseTasks:)
    @NSManaged public func addToCourseTasks(_ values: NSSet)

    @objc(removeCourseTasks:)
    @NSManaged public func removeFromCourseTasks(_ values: NSSet)

}
