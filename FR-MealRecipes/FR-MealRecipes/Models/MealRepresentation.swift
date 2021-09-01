//
//  MealRepresentation.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import Foundation

// MARK: - Meals
struct MealRepresentations: Codable {
    let meals: [MealRepresentation]
}

// MARK: - Meal
struct MealRepresentation: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
