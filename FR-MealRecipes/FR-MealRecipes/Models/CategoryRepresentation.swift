//
//  CategoryRepresentation.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import Foundation

// MARK: - Categories
struct CategoryRepresentations: Codable {
    let categories: [CategoryRepresentation]
}

// MARK: - Category
struct CategoryRepresentation: Equatable, Codable {
    let idCategory, strCategory: String?
    let strCategoryThumb: String
    let strCategoryDescription: String
}
