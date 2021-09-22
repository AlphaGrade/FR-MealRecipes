//
//  MealDetailViewController.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//
import CoreData
import UIKit

class MealDetailViewController: UIViewController, UIScrollViewDelegate {
    
    let apiController = APIController()
    var meal: Meal?
    // Tap gesture recognizers
    let tap = UITapGestureRecognizer()
    var index = 52
    
    // MARK: - View Objects
    lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        
        return label
    }()
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.backgroundColor = .systemBackground
        
        return scroll
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.backgroundColor = .systemBackground
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.axis =  .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    let strMealThumbImage = UIImageView()
    let idMealLabel = UILabel()
    let strDrinkAlternateLabel = UILabel()
    let strCategoryLabel = UILabel()
    let strAreaLabel = UILabel()
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients:"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Instructions:"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    let strInstructionsView = UITextView()
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
        updateViews()
        iterateOverType(meal: meal!)
    }
    
    private func updateViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        // MARK: - Constraints
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  0),
            self.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
        ])
    }
   
    @objc
    private func launchYoutube() {
        guard let link = meal?.strYoutube else { return }
        guard let url: URL = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc
    private func iterateOverType(meal: Meal) {
        for key in meal.entity.attributesByName.keys {
            guard let value = meal.value(forKey: key) else { continue }
            let label = UILabel()
            label.text = value as? String
            if !(label.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
                label.text = "\(key): \(value)"
                stackView.addArrangedSubview(label)
            }
        }
    }
}
