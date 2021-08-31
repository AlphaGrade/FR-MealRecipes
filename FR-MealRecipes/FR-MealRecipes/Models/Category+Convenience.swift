//
//  Category+Convenience.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

extension Category {
    @discardableResult convenience init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext,
                                        idCategory: String,
                                        strCategory: String,
                                        strCategoryDescription: String,
                                        strCategoryThumb: String) {
        self.init(context: context)
        self.idCategory = idCategory
        self.strCategory = strCategory
        self.strCategoryDescription = strCategoryDescription
        self.strCategoryThumb = strCategoryThumb
    }
}
