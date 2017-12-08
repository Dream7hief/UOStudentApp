//
//  CourseService.swift
//  UO Student
//
//  Created by Logan Poole on 12/3/17.
//  Copyright © 2017 Logan Poole. All rights reserved.
//



import CoreData
/*
class CourseService {
    //MARK: Service
    /*func getCourses() -> NSFetchedResultsController<Course> {
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "startTime", ascending: true)]
        
     return createFetchedResultsController(for: fetchRequest)
    }
    func CourseDaySelection(for course: Course) -> NSFetchedResultsController<DaySelection> {
        let fetchRequest: NSFetchRequest<DaySelection> = Week.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "course == %@", course)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "orderIndex", ascending: true)]
        
        return createFetchedResultsController(for: fetchRequest)
    }*/
    //MARK: Private
    private func createFetchedResultsController<T>(for fetchRequest: NSFetchRequest<T>) -> NSFetchedResultsController<T> {
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
          managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        }
        catch let error {
            fatalError("Could not perfom fetch for fetched results controller: \(error)")
        }
        return fetchedResultsController
    }
    
    //MARK: Initialization
    private init() {
        persistentContainer = NSPersistentContainer(name: "Duck-Study")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
            
            let context = self.persistentContainer.newBackgroundContext()
            context.perform {
                let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
                let count = (try? context.count(for: fetchRequest)) ?? 0
                guard count == 0 else {
                    return
                }
                /*Incorporate build-map functionality with plist
                let uoBldDataPath = Bundle.main.path(forResource: "BldData", ofType: "plist")!
                let uoBldData = NSArray(contentsOfFile: uoBldDataPath)
                    as! Array<Dictionary<String, (Float, Float)>>
                */
                
                do {
                    try context.save()
                }
                catch _ {
                    fatalError("Failed to save context after inserting initial building data")
                }
            }
        })
    }
    //MARK: PRIVATE
    private let persistentContainer: NSPersistentContainer
    
    //MARK: PROPERTIES
    static let shared = CourseService()
    static let daySelectKey: [Int:String] = [0:"SUN", 1:"MON", 2:"TUE", 3:"WED",
                                          4:"THU", 5:"FRI", 6:"SAT", 7:"EVERY"]
}
*/
