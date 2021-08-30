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
    var coins = [CoinRepresentation]()
//    init() {
//     fetchCoins()
//    }
    typealias CompletionHandler = (Error?) -> Void

    
    let request = URLRequest(url: baseURL)
    
    func fetchCoins(completion: @escaping ([CoinRepresentation]) -> Void = { _ in }) {
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
                let coins = try JSONDecoder().decode([CoinRepresentation].self, from: data)
                self.coins = coins
                print(coins.count)
                completion(coins)
            } catch {
                print("Unable to decode data: \(error)")
                return
            }

        }.resume()
    }
}

