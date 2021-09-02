//
//  CoreDataStack.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FR_MealRecipes")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Error loading Core Data Stack: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        var error: Error?
        
        // Could be main context or background context
        context.performAndWait {
            do {
                try context.save()
            } catch let saveError {
                error = saveError
            }
        }
        if let error = error { throw error }
    }
}
