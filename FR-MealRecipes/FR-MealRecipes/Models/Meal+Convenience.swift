//
//  Meal+Convenience.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

extension Meal {
    
    var mealRepresentation: MealRepresentation? {
        guard let idMeal = idMeal else { return nil }
        return MealRepresentation(strMeal: strMeal ?? "N/A",
                                  strMealThumb: strMealThumb ?? "N/A",
                                  idMeal: idMeal)
    }
    
    @discardableResult convenience init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                                        strMealThumb: String,
                                        strMeal: String,
                                        idMeal: String) {
        self.init(context: context)
        self.strMealThumb = strMealThumb
        self.strMeal = strMeal
        self.idMeal = idMeal
    }
    
    @discardableResult convenience init?(mealRepresentation: MealRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context,
                  strMealThumb: mealRepresentation.strMealThumb,
                  strMeal: mealRepresentation.strMeal,
                  idMeal: mealRepresentation.idMeal)
    }
}
