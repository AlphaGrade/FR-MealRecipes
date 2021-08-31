//
//  Category+Convenience.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/31/21.
//
import CoreData
import Foundation

extension Category {
    
    var categoryRepresentation: CategoryRepresentation? {
        guard let idCategory = idCategory else { return nil }
        return CategoryRepresentation(idCategory: idCategory,
                                      strCategory: strCategory ?? "N/A",
                                      strCategoryThumb: strCategoryThumb ?? "N/A",
                                      strCategoryDescription: strCategoryDescription ?? "N/A")
    }
    
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
    
    @discardableResult convenience init?(categoryRepresentation: CategoryRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context,
                  idCategory: categoryRepresentation.idCategory,
                  strCategory: categoryRepresentation.strCategory,
                  strCategoryDescription: categoryRepresentation.strCategoryDescription,
                  strCategoryThumb: categoryRepresentation.strCategoryThumb)
    }
}
