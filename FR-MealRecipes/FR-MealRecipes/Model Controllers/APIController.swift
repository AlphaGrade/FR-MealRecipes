//
//  APIController.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/30/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case post = "POST"
}

let baseURL = URL(string: "https://www.themealdb.com/api.php")!

class APIController {
    var categories = [CategoryRepresentation]()
    var meals = [MealRepresentation]()
//    init() {
//     fetchCoins()
//    }
    typealias CompletionHandler = (Error?) -> Void

    
    let request = URLRequest(url: baseURL)
    
    func fetchCategories(completion: @escaping ([CategoryRepresentation]) -> Void = { _ in }) {
        
        let request = URLRequest(url: baseURL)
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
                self.categories = categories
                completion(categories)
            } catch {
                print("Unable to decode data: \(error)")
                return
            }

        }.resume()
    }
    
    func fetchMeals(completion: @escaping ([MealRepresentation]) -> Void = { _ in }) {
        
        let request = URLRequest(url: baseURL)
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
                self.meals = meals
                print(meals.count)
                completion(meals)
            } catch {
                print("Unable to decode data: \(error)")
                return
            }

        }.resume()
    }
}

