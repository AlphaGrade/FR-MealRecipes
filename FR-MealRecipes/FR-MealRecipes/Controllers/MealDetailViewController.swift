//
//  MealDetailViewController.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

class MealDetailViewController: UIViewController {

    let apiController = APIController()
    var meal: Meal?
    
    // view variables
    lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenue", size: 25)
        
        return label
    }()
    lazy var stackView: UIStackView = {
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mealID = meal?.idMeal else { return }
        apiController.searchMeals(meal: mealID) { MealRepresentation in
            self.updateViews()
        }
        
    }
    
    private func updateViews() {
       guard let meal = apiController.fetchedMeal else { return }
        
        
    }

}
