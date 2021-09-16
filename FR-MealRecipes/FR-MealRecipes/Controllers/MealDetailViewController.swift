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
        scroll.backgroundColor = .lightGray
        
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
        self.updateViews()
    }
    
    private func updateViews() {
        guard let fetchedMeal = meal else { return }
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        
        if let mealName = fetchedMeal.strMeal {
            if !mealName.isEmpty {
                self.stackView.addArrangedSubview(self.mealNameLabel)
                self.mealNameLabel.text = fetchedMeal.strMeal
            }
        }
        if let imageThumb = fetchedMeal.strMealThumb {
            if !imageThumb.isEmpty {
                self.stackView.addArrangedSubview(self.strMealThumbImage)
                let image = self.displayURLImage(url: fetchedMeal.strMealThumb ?? "https://www.simplystamps.com/media/catalog/product/5/8/5802-n-a-stock-stamp-hcb.png")
                self.strMealThumbImage.image = image
            }
        }
        if let mealID = fetchedMeal.idMeal {
            if !mealID.isEmpty {
                self.stackView.addArrangedSubview(self.idMealLabel)
                self.idMealLabel.text = "ID: \(mealID)"
            }
        }
        if let drink = fetchedMeal.strDrinkAlternate {
            if !drink.isEmpty {
                self.stackView.addArrangedSubview(self.strDrinkAlternateLabel)
                self.strDrinkAlternateLabel.text = "Drink Alternate: \(drink)"
            }
        }
        if let category = fetchedMeal.strCategory {
            if !category.isEmpty {
                self.stackView.addArrangedSubview(self.strCategoryLabel)
                self.strCategoryLabel.text = "Category: \(category)"
            }
        }
        if let area = fetchedMeal.strArea {
            if !area.isEmpty {
                self.stackView.addArrangedSubview(self.strAreaLabel)
                self.strAreaLabel.text = "Area: \(area)"
            }
        }
        if let source = fetchedMeal.strSource {
            if !source.isEmpty {
                self.stackView.addArrangedSubview(self.strImageSourceLabel)
                self.strSourceLabel.text = "Source: \(source)"
            }
        }
        if let imageSource = fetchedMeal.strImageSource {
            if !imageSource.isEmpty {
                self.stackView.addArrangedSubview(self.strSourceLabel)
                self.strImageSourceLabel.text = "Image Source: \(imageSource)"
                self.strImageSourceLabel.numberOfLines = 2
            }
        }
        if let creative = fetchedMeal.strCreativeCommonsConfirmed {
            if !creative.isEmpty {
                self.stackView.addArrangedSubview(self.strCreativeCommonsConfirmedLabel)
                self.strCreativeCommonsConfirmedLabel.text = "Creative Commons Confirmed: \(creative)"
            }
        }
        if let dateModified = fetchedMeal.dateModified {
            if !dateModified.isEmpty {
                self.stackView.addArrangedSubview(self.dateModifiedLabel)
                self.dateModifiedLabel.text = "Date Modified: \(dateModified)"
            }
        }
        if let tags = fetchedMeal.strTags {
            if !tags.isEmpty {
                self.stackView.addArrangedSubview(self.strTagsLabel)
                self.strTagsLabel.text = "Tags: \(tags)"
            }
        }
        if let youtube = fetchedMeal.strYoutube {
            if !youtube.isEmpty {
                strYoutubeLabel.isUserInteractionEnabled = true
                tap.addTarget(self, action: #selector(launchYoutube))
                strYoutubeLabel.addGestureRecognizer(tap)
                self.stackView.addArrangedSubview(self.strYoutubeLabel)
                self.strYoutubeLabel.text = "Youtube: \(youtube)"
                self.strYoutubeLabel.numberOfLines = 2
            }
        }
        self.stackView.addArrangedSubview(ingredientsLabel)
        if let ingredient1 = fetchedMeal.strIngredient1, let measure1 = fetchedMeal.strMeasure1 {
            if !ingredient1.isEmpty && !measure1.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient1Label)
                self.strIngredient1Label.text = "Ingredient 1: \(ingredient1) | \(measure1)"
                self.strIngredient1Label.numberOfLines = 2
            }
        }
        if let ingredient2 = fetchedMeal.strIngredient2, let measure2 = fetchedMeal.strMeasure2 {
            if !ingredient2.isEmpty && !measure2.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient2Label)
                self.strIngredient2Label.text = "Ingredient 2: \(ingredient2) | \(measure2)"
                self.strIngredient2Label.numberOfLines = 2
            }
        }
        if let ingredient3 = fetchedMeal.strIngredient3, let measure3 = fetchedMeal.strMeasure3 {
            if !ingredient3.isEmpty && !measure3.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient3Label)
                self.strIngredient3Label.text = "Ingredient 3: \(ingredient3) | \(measure3)"
                self.strIngredient3Label.numberOfLines = 2
            }
        }
        if let ingredient4 = fetchedMeal.strIngredient4, let measure4 = fetchedMeal.strMeasure4 {
            if !ingredient4.isEmpty && !measure4.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient4Label)
                self.strIngredient4Label.text = "Ingredient 4: \(ingredient4) | \(measure4)"
                self.strIngredient4Label.numberOfLines = 2
            }
        }
        if let ingredient5 = fetchedMeal.strIngredient5, let measure5 = fetchedMeal.strMeasure5 {
            if !ingredient5.isEmpty && !measure5.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient5Label)
                self.strIngredient5Label.text = "Ingredient 5: \(ingredient5) | \(measure5)"
                self.strIngredient5Label.numberOfLines = 2
            }
        }
        if let ingredient6 = fetchedMeal.strIngredient6, let measure6 = fetchedMeal.strMeasure6 {
            if !ingredient6.isEmpty && !measure6.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient6Label)
                self.strIngredient6Label.text = "Ingredient 6: \(ingredient6) | \(measure6)"
            }
        }
        if let ingredient7 = fetchedMeal.strIngredient7, let measure7 = fetchedMeal.strMeasure7 {
            if !ingredient7.isEmpty && !measure7.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient7Label)
                self.strIngredient7Label.text = "Ingredient 7: \(ingredient7) | \(measure7)"
            }
        }
        if let ingredient8 = fetchedMeal.strIngredient8, let measure8 = fetchedMeal.strMeasure8 {
            if !ingredient8.isEmpty && !measure8.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient8Label)
                self.strIngredient8Label.text = "Ingredient 8: \(ingredient8) | \(measure8)"
            }
        }
        if let ingredient9 = fetchedMeal.strIngredient9, let measure9 = fetchedMeal.strMeasure9 {
            if !ingredient9.isEmpty && !measure9.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient9Label)
                self.strIngredient9Label.text = "Ingredient 9: \(ingredient9) | \(measure9)"
            }
        }
        if let ingredient10 = fetchedMeal.strIngredient10, let measure10 = fetchedMeal.strMeasure10 {
            if !ingredient10.isEmpty && !measure10.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient10Label)
                self.strIngredient10Label.text = "Ingredient 10: \(ingredient10) | \(measure10)"
            }
        }
        if let ingredient11 = fetchedMeal.strIngredient11, let measure11 = fetchedMeal.strMeasure11 {
            if !ingredient11.isEmpty && !measure11.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient11Label)
                self.strIngredient11Label.text = "Ingredient 11: \(ingredient11) | \(measure11)"
            }
        }
        if let ingredient12 = fetchedMeal.strIngredient12, let measure12 = fetchedMeal.strMeasure12 {
            if !ingredient12.isEmpty && !measure12.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient12Label)
                self.strIngredient12Label.text = "Ingredient 12: \(ingredient12) | \(measure12)"
            }
        }
        if let ingredient13 = fetchedMeal.strIngredient13, let measure13 = fetchedMeal.strMeasure13 {
            if !ingredient13.isEmpty && !measure13.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient13Label)
                self.strIngredient13Label.text = "Ingredient 13: \(ingredient13) | \(measure13)"
            }
        }
        if let ingredient14 = fetchedMeal.strIngredient14, let measure14 = fetchedMeal.strMeasure14 {
            if !ingredient14.isEmpty && !measure14.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient14Label)
                self.strIngredient14Label.text = "Ingredient 14: \(ingredient14) | \(measure14)"
            }
        }
        if let ingredient15 = fetchedMeal.strIngredient15, let measure15 = fetchedMeal.strMeasure15 {
            if !ingredient15.isEmpty && !measure15.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient15Label)
                self.strIngredient15Label.text = "Ingredient 15: \(ingredient15) | \(measure15)"
            }
        }
        if let ingredient16 = fetchedMeal.strIngredient16, let measure16 = fetchedMeal.strMeasure16 {
            if !ingredient16.isEmpty && !measure16.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient16Label)
                self.strIngredient16Label.text = "Ingredient 16: \(ingredient16) | \(measure16)"
            }
        }
        if let ingredient17 = fetchedMeal.strIngredient17, let measure17 = fetchedMeal.strMeasure17 {
            if !ingredient17.isEmpty && !measure17.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient17Label)
                self.strIngredient17Label.text = "Ingredient 17: \(ingredient17) | \(measure17)"
            }
        }
        if let ingredient18 = fetchedMeal.strIngredient18, let measure18 = fetchedMeal.strMeasure18 {
            if !ingredient18.isEmpty && !measure18.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient18Label)
                self.strIngredient18Label.text = "Ingredient 18: \(ingredient18) | \(measure18)"
            }
        }
        if let ingredient19 = fetchedMeal.strIngredient19, let measure19 = fetchedMeal.strMeasure19 {
            if !ingredient19.isEmpty && !measure19.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient19Label)
                self.strIngredient19Label.text = "Ingredient 19: \(ingredient19) | \(measure19)"
            }
        }
        if let ingredient20 = fetchedMeal.strIngredient20, let measure20 = fetchedMeal.strMeasure20 {
            if !ingredient20.isEmpty && !measure20.isEmpty {
                self.stackView.addArrangedSubview(self.strIngredient20Label)
                self.strIngredient20Label.text = "Ingredient 20: \(ingredient20) | \(measure20)"
            }
        }
        self.stackView.addArrangedSubview(instructionsLabel)
        if let instructions = fetchedMeal.strInstructions {
            if !instructions.isEmpty {
                self.stackView.addArrangedSubview(self.strInstructionsView)
                self.strInstructionsView.text = instructions
                self.strInstructionsView.backgroundColor = .lightGray
                strInstructionsView.font = UIFont.systemFont(ofSize: 18)
                strInstructionsView.isEditable = false
            }
        }
        // MARK: - Constraints
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant:  -10),
            self.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -5),
            self.mealNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.strMealThumbImage.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.3),
            self.strMealThumbImage.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.8),
            self.strInstructionsView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.3),
            self.strInstructionsView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.8),
            self.strInstructionsView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        ])
    }
   
    @objc
    func launchYoutube() {
        guard let link = meal?.strYoutube else { return }
        guard let url: URL = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}
