//
//  Meal+Convenience.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

extension Meal {
    @discardableResult convenience init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                                        strMealThumb: String,
                                        strMeal: String,
                                        idMeal: String) {
        self.init(context: context)
        self.strMealThumb = strMealThumb
        self.strMeal = strMeal
        self.idMeal = idMeal
    }
}
