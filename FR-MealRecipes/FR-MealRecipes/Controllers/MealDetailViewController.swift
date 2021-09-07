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
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.axis =  .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    let strMealLabel = UILabel()
    let strMealThumbImage = UIImageView()
    let idMealLabel = UILabel()
    let strDrinkAlternateLabel = UILabel()
    let strCategoryLabel = UILabel()
    let strAreaLabel = UILabel()
    let strInstructionsLabel = UILabel()
    let strTagsLabel = UILabel()
    let strYoutubeLabel = UILabel()
    let strIngredient1Label = UILabel()
    let strIngredient2Label = UILabel()
    let strIngredient3Label = UILabel()
    let strIngredient4Label = UILabel()
    let strIngredient5Label = UILabel()
    let strIngredient6Label = UILabel()
    let strIngredient7Label = UILabel()
    let strIngredient8Label = UILabel()
    let strIngredient9Label = UILabel()
    let strIngredient10Label = UILabel()
    let strIngredient11Label = UILabel()
    let strIngredient12Label = UILabel()
    let strIngredient13Label = UILabel()
    let strIngredient14Label = UILabel()
    let strIngredient15Label = UILabel()
    let strIngredient16Label = UILabel()
    let strIngredient17Label = UILabel()
    let strIngredient18Label = UILabel()
    let strIngredient19Label = UILabel()
    let strIngredient20Label = UILabel()
    let strMeasure1Label = UILabel()
    let strMeasure2Label = UILabel()
    let strMeasure3Label = UILabel()
    let strMeasure4Label = UILabel()
    let strMeasure5Label = UILabel()
    let strMeasure6Label = UILabel()
    let strMeasure7Label = UILabel()
    let strMeasure8Label = UILabel()
    let strMeasure9Label = UILabel()
    let strMeasure10Label = UILabel()
    let strMeasure11Label = UILabel()
    let strMeasure12Label = UILabel()
    let strMeasure13Label = UILabel()
    let strMeasure14Label = UILabel()
    let strMeasure15Label = UILabel()
    let strMeasure16Label = UILabel()
    let strMeasure17Label = UILabel()
    let strMeasure18Label = UILabel()
    let strMeasure19Label = UILabel()
    let strMeasure20Label = UILabel()
    let strSourceLabel = UILabel()
    let strImageSourceLabel = UILabel()
    let strCreativeCommonsConfirmedLabel = UILabel()
    let dateModifiedLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mealID = meal?.idMeal else { return }
        apiController.searchMeals(meal: mealID) { MealRepresentation in
            self.updateViews()
        }
        
    }
    
    private func updateViews() {
        guard apiController.fetchedMeal != nil else { return }
        view.addSubview(stackView)
        stackView.addArrangedSubview(strMealThumbImage)
        stackView.addArrangedSubview(strMealLabel)
        stackView.addArrangedSubview(idMealLabel)
        stackView.addArrangedSubview(strDrinkAlternateLabel)
        stackView.addArrangedSubview(strCategoryLabel)
        stackView.addArrangedSubview(strAreaLabel)
        stackView.addArrangedSubview(strInstructionsLabel)
        stackView.addArrangedSubview(strTagsLabel)
        stackView.addArrangedSubview(strYoutubeLabel)
        stackView.addArrangedSubview(strIngredient1Label)
        stackView.addArrangedSubview(strIngredient2Label)
        stackView.addArrangedSubview(strIngredient3Label)
        stackView.addArrangedSubview(strIngredient4Label)
        stackView.addArrangedSubview(strIngredient5Label)
        stackView.addArrangedSubview(strIngredient6Label)
        stackView.addArrangedSubview(strIngredient7Label)
        stackView.addArrangedSubview(strIngredient8Label)
        stackView.addArrangedSubview(strIngredient9Label)
        stackView.addArrangedSubview(strIngredient10Label)
        stackView.addArrangedSubview(strIngredient11Label)
        stackView.addArrangedSubview(strIngredient12Label)
        stackView.addArrangedSubview(strIngredient13Label)
        stackView.addArrangedSubview(strIngredient14Label)
        stackView.addArrangedSubview(strIngredient15Label)
        stackView.addArrangedSubview(strIngredient16Label)
        stackView.addArrangedSubview(strIngredient17Label)
        stackView.addArrangedSubview(strIngredient18Label)
        stackView.addArrangedSubview(strIngredient19Label)
        stackView.addArrangedSubview(strIngredient20Label)
        stackView.addArrangedSubview(strMeasure1Label)
        stackView.addArrangedSubview(strMeasure2Label)
        stackView.addArrangedSubview(strMeasure3Label)
        stackView.addArrangedSubview(strMeasure4Label)
        stackView.addArrangedSubview(strMeasure5Label)
        stackView.addArrangedSubview(strMeasure6Label)
        stackView.addArrangedSubview(strMeasure7Label)
        stackView.addArrangedSubview(strMeasure8Label)
        stackView.addArrangedSubview(strMeasure9Label)
        stackView.addArrangedSubview(strMeasure10Label)
        stackView.addArrangedSubview(strMeasure11Label)
        stackView.addArrangedSubview(strMeasure12Label)
        stackView.addArrangedSubview(strMeasure13Label)
        stackView.addArrangedSubview(strMeasure14Label)
        stackView.addArrangedSubview(strMeasure15Label)
        stackView.addArrangedSubview(strMeasure16Label)
        stackView.addArrangedSubview(strMeasure17Label)
        stackView.addArrangedSubview(strMeasure18Label)
        stackView.addArrangedSubview(strMeasure19Label)
        stackView.addArrangedSubview(strMeasure20Label)
        stackView.addArrangedSubview(strSourceLabel)
        stackView.addArrangedSubview(strImageSourceLabel)
        stackView.addArrangedSubview(strCreativeCommonsConfirmedLabel)
        stackView.addArrangedSubview(dateModifiedLabel)
    
    
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    // Inspiration comes from: https://stackoverflow.com/questions/61245635/iterate-stackview-swift
    private func hideNullAttribs() {
        guard let meal = apiController.fetchedMeal else { return }
        
        var mirror = Mirror(reflecting: meal)
        
        for case let (label?, value) in mirror.children {
            if value as! String == "null" {
//                stackView.arrangedSubviews[label].isHidden = true
            }
        }
    }
    
}
