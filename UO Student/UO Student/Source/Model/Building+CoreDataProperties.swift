//
//  Building+CoreDataProperties.swift
//  
//
//  Created by Logan Poole on 12/7/17.
//
//

import Foundation
import CoreData


extension Building {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Building> {
        return NSFetchRequest<Building>(entityName: "Building")
    }

    @NSManaged public var name: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var buildingCourses: NSSet?
    @NSManaged public var bildingInstructors: NSSet?

}

// MARK: Generated accessors for buildingCourses
extension Building {

    @objc(addBuildingCoursesObject:)
    @NSManaged public func addToBuildingCourses(_ value: Course)

    @objc(removeBuildingCoursesObject:)
    @NSManaged public func removeFromBuildingCourses(_ value: Course)

    @objc(addBuildingCourses:)
    @NSManaged public func addToBuildingCourses(_ values: NSSet)

    @objc(removeBuildingCourses:)
    @NSManaged public func removeFromBuildingCourses(_ values: NSSet)

}

// MARK: Generated accessors for bildingInstructors
extension Building {

    @objc(addBildingInstructorsObject:)
    @NSManaged public func addToBildingInstructors(_ value: Instructor)

    @objc(removeBildingInstructorsObject:)
    @NSManaged public func removeFromBildingInstructors(_ value: Instructor)

    @objc(addBildingInstructors:)
    @NSManaged public func addToBildingInstructors(_ values: NSSet)

    @objc(removeBildingInstructors:)
    @NSManaged public func removeFromBildingInstructors(_ values: NSSet)

}
