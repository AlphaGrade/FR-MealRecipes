//
//  CoreDataController.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

class CoreDataController {
    let apiController = APIController()
    
    func fetchCategories() {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        do {
            let categories = try? moc.fetch(fetchRequest)
        } catch {
            print("Error Fetching Categories: \(error)")
        }
    }
    
    // MARK: - CRUD Data Model Methods
    
    func create(category: CategoryRepresentation) {
        let moc = CoreDataStack.shared.mainContext
        let newCategory = Category(context: moc, idCategory: category.idCategory,
                                   strCategory: category.strCategory,
                                   strCategoryDescription: category.strCategoryDescription,
                                   strCategoryThumb: category.strCategoryThumb)
        save()
    }
    
    // TODO: - Setup Firebase to save and delete favorited meals
    // Saves content to Core Data
    func save() {
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()
        } catch {
            print("There was a problem saving: \(error)")
        }
    }
    // MARK: - Deletes saved favorite from CoreData and firebase profile
    func delete(meal: Meal) {
        let moc = CoreDataStack.shared.mainContext
        moc.delete(meal)
        apiController.deleteSavedFavorite(meal)
    }
    // Method Credit: https://stackoverflow.com/questions/24658641/ios-delete-all-core-data-swift
    func deleteAll(entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let moc = CoreDataStack.shared.mainContext
                do {
                    try moc.execute(batchDeleteRequest)
                } catch {
                    print("Detele all data in \(entityName) error :", error)
                }
            }
}
