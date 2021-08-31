//
//  APIController.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/30/21.
//
import CoreData
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case post = "POST"
}

let baseURL = URL(string: "https://www.themealdb.com/")!

class APIController {
    
//    init() {
//     fetchCoins()
//    }
    typealias CompletionHandler = (Error?) -> Void

    
    let request = URLRequest(url: baseURL)
    
    func fetchCategories(completion: @escaping ([CategoryRepresentation]) -> Void = { _ in }) {
        let requestURL = baseURL.appendingPathExtension("api/json/v1/1/categories.php")
        let request = URLRequest(url: requestURL)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("There was an error: \(error)")
                return
            }
            guard let data = data else {
                print("No data returned")
                return
            }
            do {
                let categories = try JSONDecoder().decode([CategoryRepresentation].self, from: data)
                try self.updateCategories(with: categories)
                completion(categories)
            } catch {
                print("Unable to decode data: \(error)")
                return
            }

        }.resume()
    }
    
    func updateCategories(with categoryRepresentations: [CategoryRepresentation]) throws {
        let entriesWithID = categoryRepresentations.filter{( $0.idCategory != nil)}
        let identfiersToFetch = entriesWithID.compactMap({ $0.idCategory })
        
        let representationByID = Dictionary(uniqueKeysWithValues: zip(identfiersToFetch,
                                                                       entriesWithID))
        let entriesToCreate = representationByID
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idCategory IN %@")
        
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.perform {
            do {
                let existingEntries = try context.fetch(fetchRequest)
                for entry in existingEntries {
                    guard let id = entry.idCategory,
                          let representation = representationByID[id] else {
                        context.delete(entry)
                        continue
                    }
                    entry.strCategory = representation.strCategory
                    entry.strCategoryThumb = representation.strCategoryThumb
                    entry.strCategoryDescription = representation.strCategoryDescription
                }
                for representation in entriesToCreate.values {
                    Category(categoryRepresentation: representation, context: context)
                }
            } catch {
                print("Error fetching: \(error)")
            }
        }
        // Persist all changes to Core Data
        try? CoreDataStack.shared.save(context: context)
    }
    
    func fetchMeals(categories: [String], completion: @escaping ([MealRepresentation]) -> Void = { _ in }) {
        for category in categories {
            let requestURL = baseURL.appendingPathExtension(category)
            let request = URLRequest(url: requestURL)
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    print("There was an error: \(error)")
                    return
                }
                guard let data = data else {
                    print("No data returned")
                    return
                }
                do {
                    let meals = try JSONDecoder().decode([MealRepresentation].self, from: data)
                    try self.updateMeals(with: meals)
                    completion(meals)
                } catch {
                    print("Unable to decode data: \(error)")
                    return
                }

            }.resume()
        }
    }
    
    func updateMeals(with mealRepresentations: [MealRepresentation]) throws {
        let entriesWithID = mealRepresentations.filter{( $0.idMeal != nil)}
        let identfiersToFetch = entriesWithID.compactMap({ $0.idMeal })
        
        let representationByID = Dictionary(uniqueKeysWithValues: zip(identfiersToFetch,
                                                                       entriesWithID))
        var entriesToCreate = representationByID
        
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idMeal IN %@")
        
        let context = CoreDataStack.shared.container.newBackgroundContext()
        
        context.perform {
            do {
                let existingEntries = try context.fetch(fetchRequest)
                for entry in existingEntries {
                    guard let id = entry.idMeal,
                          let representation = representationByID[id] else {
                        context.delete(entry)
                        continue
                    }
                    
                    entry.strMeal = representation.strMeal
                    entry.strMealThumb = representation.strMealThumb
                }
                for representation in entriesToCreate.values {
                    Meal(mealRepresentation: representation, context: context)
                }
            } catch {
                print("Error fetching: \(error)")
            }
        }
        // Persist all changes to Core Data
        try? CoreDataStack.shared.save(context: context)
    }
    
    //Delete
    func deleteSavedFavorite(_ meal: Meal, completion: @escaping CompletionHandler = { _ in }) {
        guard let uuid =  meal.idMeal else {
             completion(NSError())
             return
         }
         
         let requestURL = baseURL.appendingPathComponent(uuid).appendingPathExtension("json")
         var request = URLRequest(url: requestURL)
         request.httpMethod = "DELETE"
         
         URLSession.shared.dataTask(with: request) { (_, _, error) in
          
             completion(nil)
         }.resume()
     }
}

