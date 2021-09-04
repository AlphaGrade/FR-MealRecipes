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
        label.font = UIFont(name: , size: 25)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let meal = meal else { return }
        guard let mealID = meal.idMeal else { return }
        apiController.fetchSearchedMeal(meal: mealID) { _ in
            
        }
        
    }

}
