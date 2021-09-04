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
                                        strMealThumb: String?,
                                        strMeal: String?,
                                        idMeal: String?,
                                        strDrinkAlternate: String?,
                                        strCategory: String,
                                        strArea: String,
                                        strInstructions: String,
                                        strTags: String,
                                        strYoutube: String,
                                        strIngredient1: String,
                                        strIngredient2: String,
                                        strIngredient3: String,
                                        strIngredient4: String,
                                        strIngredient5: String,
                                        strIngredient6: String,
                                        strIngredient7: String,
                                        strIngredient8: String,
                                        strIngredient9: String,
                                        strIngredient10: String,
                                        strIngredient11: String,
                                        strIngredient12: String,
                                        strIngredient13: String,
                                        strIngredient14: String,
                                        strIngredient15: String,
                                        strIngredient16: String,
                                        strIngredient17: String,
                                        strIngredient18: String,
                                        strIngredient19: String,
                                        strIngredient20: String,
                                        strMeasure1: String,
                                        strMeasure2: String,
                                        strMeasure3: String,
                                        strMeasure4: String,
                                        strMeasure5: String,
                                        strMeasure6: String,
                                        strMeasure7: String,
                                        strMeasure8: String,
                                        strMeasure9: String,
                                        strMeasure10: String,
                                        strMeasure11: String,
                                        strMeasure12: String,
                                        strMeasure13: String,
                                        strMeasure14: String,
                                        strMeasure15: String,
                                        strMeasure16: String,
                                        strMeasure17: String,
                                        strMeasure18: String,
                                        strMeasure19: String,
                                        strMeasure20: String,
                                        strSource: String,
                                        strImageSource: String,
                                        strCreativeCommonsConfirmed: String,
                                        dateModified: String) {
        self.init(context: context)
        self.strMealThumb = strMealThumb
        self.strMeal = strMeal
        self.idMeal = idMeal
        self.strMealThumb = strMealThumb
        self.strMeal = strMeal
        self.idMeal = idMeal
        self.strDrinkAlternate = strDrinkAlternate
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strTags = strTags
        self.strYoutube = strYoutube
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
        self.strSource = strSource
        self.strImageSource = strImageSource
        self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
    }
    
    @discardableResult convenience init?(mealRepresentation: MealRepresentation,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                                         strMealThumb: String?,
                                         strMeal: String?,
                                         idMeal: String?,
                                         strDrinkAlternate: String?,
                                         strCategory: String?,
                                         strArea: String?,
                                         strInstructions: String?,
                                         strTags: String?,
                                         strYoutube: String?,
                                         strIngredient1: String,
                                         strIngredient2: String,
                                         strIngredient3: String,
                                         strIngredient4: String,
                                         strIngredient5: String,
                                         strIngredient6: String,
                                         strIngredient7: String,
                                         strIngredient8: String,
                                         strIngredient9: String,
                                         strIngredient10: String,
                                         strIngredient11: String,
                                         strIngredient12: String,
                                         strIngredient13: String,
                                         strIngredient14: String,
                                         strIngredient15: String,
                                         strIngredient16: String,
                                         strIngredient17: String,
                                         strIngredient18: String,
                                         strIngredient19: String,
                                         strIngredient20: String,
                                         strMeasure1: String,
                                         strMeasure2: String,
                                         strMeasure3: String,
                                         strMeasure4: String,
                                         strMeasure5: String,
                                         strMeasure6: String,
                                         strMeasure7: String,
                                         strMeasure8: String,
                                         strMeasure9: String,
                                         strMeasure10: String,
                                         strMeasure11: String,
                                         strMeasure12: String,
                                         strMeasure13: String,
                                         strMeasure14: String,
                                         strMeasure15: String,
                                         strMeasure16: String,
                                         strMeasure17: String,
                                         strMeasure18: String,
                                         strMeasure19: String,
                                         strMeasure20: String,
                                         strSource: String,
                                         strImageSource: String,
                                         strCreativeCommonsConfirmed: String,
                                         dateModified: String) {
         self.init(context: context)
         self.strMealThumb = strMealThumb
         self.strMeal = strMeal
         self.idMeal = idMeal
         self.strMealThumb = strMealThumb
         self.strMeal = strMeal
         self.idMeal = idMeal
         self.strDrinkAlternate = strDrinkAlternate
         self.strCategory = strCategory
         self.strArea = strArea
         self.strInstructions = strInstructions
         self.strTags = strTags
         self.strYoutube = strYoutube
         self.strIngredient1 = strIngredient1
         self.strIngredient2 = strIngredient2
         self.strIngredient3 = strIngredient3
         self.strIngredient4 = strIngredient4
         self.strIngredient5 = strIngredient5
         self.strIngredient6 = strIngredient6
         self.strIngredient7 = strIngredient7
         self.strIngredient8 = strIngredient8
         self.strIngredient9 = strIngredient9
         self.strIngredient10 = strIngredient10
         self.strIngredient11 = strIngredient11
         self.strIngredient12 = strIngredient12
         self.strIngredient13 = strIngredient13
         self.strIngredient14 = strIngredient14
         self.strIngredient15 = strIngredient15
         self.strIngredient16 = strIngredient16
         self.strIngredient17 = strIngredient17
         self.strIngredient18 = strIngredient18
         self.strIngredient19 = strIngredient19
         self.strIngredient20 = strIngredient20
         self.strMeasure1 = strMeasure1
         self.strMeasure2 = strMeasure2
         self.strMeasure3 = strMeasure3
         self.strMeasure4 = strMeasure4
         self.strMeasure5 = strMeasure5
         self.strMeasure6 = strMeasure6
         self.strMeasure7 = strMeasure7
         self.strMeasure8 = strMeasure8
         self.strMeasure9 = strMeasure9
         self.strMeasure10 = strMeasure10
         self.strMeasure11 = strMeasure11
         self.strMeasure12 = strMeasure12
         self.strMeasure13 = strMeasure13
         self.strMeasure14 = strMeasure14
         self.strMeasure15 = strMeasure15
         self.strMeasure16 = strMeasure16
         self.strMeasure17 = strMeasure17
         self.strMeasure18 = strMeasure18
         self.strMeasure19 = strMeasure19
         self.strMeasure20 = strMeasure20
         self.strSource = strSource
         self.strImageSource = strImageSource
         self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
         self.dateModified = dateModified) {
        self.init(context: context,
                  strMealThumb: mealRepresentation.strMealThumb,
                  strMeal: mealRepresentation.strMeal,
                  idMeal: mealRepresentation.idMeal)
    }
}
