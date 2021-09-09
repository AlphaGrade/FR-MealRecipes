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
    
    typealias CompletionHandler = (Error?) -> Void
    var fetchedCategories: [String] = []
    var fetchedMeal: [MealRepresentation]?
    let request = URLRequest(url: baseURL)
    
    func fetchCategories(completion: @escaping ([CategoryRepresentation]) -> Void = { _ in }) {
        let requestURL = baseURL.appendingPathComponent("api/json/v1/1/categories.php")
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
                let categories = try JSONDecoder().decode(CategoryRepresentations.self, from: data).categories
                for category in categories {
                    self.fetchedCategories.append(category.strCategory)
                }
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
        var entriesToCreate = representationByID
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idCategory IN %@", identfiersToFetch)
        
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
                    entriesToCreate.removeValue(forKey: id)
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
    
    func fetchMeals(category: [String], completion: @escaping ([MealRepresentation]) -> Void = { _ in }) {
        for category in category {
            let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + category
            let requestURL = URL(string: url)!
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
                        let meals = try JSONDecoder().decode(MealRepresentations.self, from: data).meals
                        try self.updateMeals(category: category, with: meals)
                        completion(meals)
                    } catch {
                        print("Unable to decode data: \(error)")
                        return
                    }

                }.resume()
            }
    }
    
    func searchMeals(meal: String, completion: @escaping ([MealRepresentation]) -> Void = { _ in }) {
            let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + meal
            let requestURL = URL(string: url)!
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
                        let meal = try JSONDecoder().decode(MealRepresentations.self, from: data).meals
                        self.fetchedMeal = meal
                        completion(meal)
                    } catch {
                        print("Unable to decode data: \(error)")
                        return
                    }

                }.resume()
    
    }
    
    func updateMeals(category: String, with mealRepresentations: [MealRepresentation]) throws {
        let entriesWithID = mealRepresentations.filter{( $0.idMeal != nil )}
        let identfiersToFetch = mealRepresentations.compactMap({ $0.idMeal })
        
        let representationByID = Dictionary(uniqueKeysWithValues: zip(identfiersToFetch,
                                                                      entriesWithID))
        var entriesToCreate = representationByID
        
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idMeal IN %@", identfiersToFetch)
        
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
                    entriesToCreate.removeValue(forKey: id)
                }
                for representation in entriesToCreate.values {
                    _ = Meal(context: context, strMealThumb: representation.strMealThumb,
                                    strMeal: representation.strMeal,
                                    idMeal: representation.idMeal)
                }
            } catch {
                print("Error fetching: \(error)")
            }
        }
        // Persist all changes to Core Data
        try? CoreDataStack.shared.save(context: context)
    }
}

