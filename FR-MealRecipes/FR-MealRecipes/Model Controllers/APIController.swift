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
    var fetchedMeals = [MealRepresentation]()
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
                        self.fetchedMeals = meals
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
                        self.fetchedMeals = meal
                        completion(meal)
                    } catch {
                        print("Unable to decode data: \(error)")
                        return
                    }

                }.resume()
    
    }
    
    func fetchFullMealInfo(meals: [MealRepresentation], completion: @escaping ([MealRepresentation]) -> Void = { _ in }) {
        let mealIDs = meals.compactMap({ $0.idMeal })
        for mealID in mealIDs {
            let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + mealID
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
                        try self.updateMeal(with: meal)
                        completion(meal)
                    } catch {
                        print("Unable to decode data: \(error)")
                        return
                    }

                }.resume()
        }
    }
    
    func updateMeal(with mealRepresentations: [MealRepresentation]) throws {
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
                    entry.strDrinkAlternate = representation.strDrinkAlternate
                    entry.strCategory = representation.strCategory
                    entry.strArea = representation.strArea
                    entry.strInstructions = representation.strInstructions
                    entry.strTags = representation.strTags
                    entry.strYoutube = representation.strYoutube
                    entry.strIngredient1 = representation.strIngredient1
                    entry.strIngredient2 = representation.strIngredient2
                    entry.strIngredient3 = representation.strIngredient3
                    entry.strIngredient4 = representation.strIngredient4
                    entry.strIngredient5 = representation.strIngredient5
                    entry.strIngredient6 = representation.strIngredient6
                    entry.strIngredient7 = representation.strIngredient7
                    entry.strIngredient8 = representation.strIngredient8
                    entry.strIngredient9 = representation.strIngredient9
                    entry.strIngredient10 = representation.strIngredient10
                    entry.strIngredient11 = representation.strIngredient11
                    entry.strIngredient12 = representation.strIngredient12
                    entry.strIngredient13 = representation.strIngredient13
                    entry.strIngredient14 = representation.strIngredient14
                    entry.strIngredient15 = representation.strIngredient15
                    entry.strIngredient16 = representation.strIngredient16
                    entry.strIngredient17 = representation.strIngredient17
                    entry.strIngredient18 = representation.strIngredient18
                    entry.strIngredient19 = representation.strIngredient19
                    entry.strIngredient20 = representation.strIngredient20
                    entry.strMeasure1 = representation.strMeasure1
                    entry.strMeasure2 = representation.strMeasure2
                    entry.strMeasure3 = representation.strMeasure3
                    entry.strMeasure4 = representation.strMeasure4
                    entry.strMeasure5 = representation.strMeasure5
                    entry.strMeasure6 = representation.strMeasure6
                    entry.strMeasure7 = representation.strMeasure7
                    entry.strMeasure8 = representation.strMeasure8
                    entry.strMeasure9 = representation.strMeasure9
                    entry.strMeasure10 = representation.strMeasure10
                    entry.strMeasure11 = representation.strMeasure11
                    entry.strMeasure12 = representation.strMeasure12
                    entry.strMeasure13 = representation.strMeasure13
                    entry.strMeasure14 = representation.strMeasure14
                    entry.strMeasure15 = representation.strMeasure15
                    entry.strMeasure16 = representation.strMeasure16
                    entry.strMeasure17 = representation.strMeasure17
                    entry.strMeasure18 = representation.strMeasure18
                    entry.strMeasure19 = representation.strMeasure19
                    entry.strMeasure20 = representation.strMeasure20
                    entry.strSource = representation.strSource
                    entry.strImageSource = representation.strImageSource
                    entry.strCreativeCommonsConfirmed = representation.strCreativeCommonsConfirmed
                    entry.dateModified = representation.dateModified
                    entriesToCreate.removeValue(forKey: id)
                }
                for representation in entriesToCreate.values {
                    _ = Meal(context: context, strMealThumb: representation.strMealThumb,
                                    strMeal: representation.strMeal,
                                    idMeal: representation.idMeal,
                                    strDrinkAlternate: representation.strDrinkAlternate,
                                    strCategory: representation.strCategory,
                                    strArea: representation.strArea,
                                    strInstructions: representation.strInstructions,
                                    strTags: representation.strTags,
                                    strYoutube: representation.strYoutube,
                                    strIngredient1: representation.strIngredient1,
                                    strIngredient2: representation.strIngredient2,
                                    strIngredient3: representation.strIngredient3,
                                    strIngredient4: representation.strIngredient4,
                                    strIngredient5: representation.strIngredient5,
                                    strIngredient6: representation.strIngredient6,
                                    strIngredient7: representation.strIngredient7,
                                    strIngredient8: representation.strIngredient8,
                                    strIngredient9: representation.strIngredient9,
                                    strIngredient10: representation.strIngredient10,
                                    strIngredient11: representation.strIngredient11,
                                    strIngredient12: representation.strIngredient12,
                                    strIngredient13: representation.strIngredient13,
                                    strIngredient14: representation.strIngredient14,
                                    strIngredient15: representation.strIngredient15,
                                    strIngredient16: representation.strIngredient16,
                                    strIngredient17: representation.strIngredient17,
                                    strIngredient18: representation.strIngredient18,
                                    strIngredient19: representation.strIngredient19,
                                    strIngredient20: representation.strIngredient20,
                                    strMeasure1: representation.strMeasure1,
                                    strMeasure2: representation.strMeasure2,
                                    strMeasure3: representation.strMeasure3,
                                    strMeasure4: representation.strMeasure4,
                                    strMeasure5: representation.strMeasure5,
                                    strMeasure6: representation.strMeasure6,
                                    strMeasure7: representation.strMeasure7,
                                    strMeasure8: representation.strMeasure8,
                                    strMeasure9: representation.strMeasure9,
                                    strMeasure10: representation.strMeasure10,
                                    strMeasure11: representation.strMeasure11,
                                    strMeasure12: representation.strMeasure12,
                                    strMeasure13: representation.strMeasure13,
                                    strMeasure14: representation.strMeasure14,
                                    strMeasure15: representation.strMeasure15,
                                    strMeasure16: representation.strMeasure16,
                                    strMeasure17: representation.strMeasure17,
                                    strMeasure18: representation.strMeasure18,
                                    strMeasure19: representation.strMeasure19,
                                    strMeasure20: representation.strMeasure20,
                                    strSource: representation.strSource,
                                    strImageSource: representation.strImageSource,
                                    strCreativeCommonsConfirmed: representation.strCreativeCommonsConfirmed,
                                    dateModified:representation.dateModified)
                }
            } catch {
                print("Error fetching: \(error)")
            }
        }
        // Persist all changes to Core Data
        try? CoreDataStack.shared.save(context: context)
    }
}

