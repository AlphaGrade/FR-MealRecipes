//
//  MealDetailViewController.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

class MealDetailViewController: UIViewController, UIScrollViewDelegate {
    
    let apiController = APIController()
    var meal: Meal?
    
    // view variables
    lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.tintColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        
        return label
    }()
    lazy var scrollView = UIScrollView()
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
//    let strMealLabel = UILabel()
    let strMealThumbImage = UIImageView()
    let idMealLabel = UILabel()
    let strDrinkAlternateLabel = UILabel()
    let strCategoryLabel = UILabel()
    let strAreaLabel = UILabel()
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
        super.viewDidLoad()
        guard let mealID = meal?.idMeal else { return }
        apiController.searchMeals(meal: mealID) { MealRepresentation in
            self.updateViews()
        }
        
    }
    
    private func updateViews() {
        guard let fetchedMeal = apiController.fetchedMeal?[0] else { return }
        
        DispatchQueue.main.async {
            self.view.addSubview(self.scrollView)
//            self.scrollView.delegate = self
//            self.scrollView.frame = self.view.bounds
            self.scrollView.backgroundColor = .lightGray
//            self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: (self.view.frame.size.height + 500))
            self.scrollView.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.isScrollEnabled = true
            self.scrollView.addSubview(self.stackView)
            self.stackView.addArrangedSubview(self.mealNameLabel)
            self.stackView.addArrangedSubview(self.strMealThumbImage)
            self.stackView.addArrangedSubview(self.idMealLabel)
//            self.stackView.addArrangedSubview(self.strMealLabel)
            self.stackView.addArrangedSubview(self.strDrinkAlternateLabel)
            self.stackView.addArrangedSubview(self.strCategoryLabel)
            self.stackView.addArrangedSubview(self.strAreaLabel)
            self.stackView.addArrangedSubview(self.strInstructionsView)
            self.stackView.addArrangedSubview(self.strTagsLabel)
            self.stackView.addArrangedSubview(self.strYoutubeLabel)
            self.stackView.addArrangedSubview(self.strIngredient1Label)
            self.stackView.addArrangedSubview(self.strIngredient2Label)
            self.stackView.addArrangedSubview(self.strIngredient3Label)
            self.stackView.addArrangedSubview(self.strIngredient4Label)
            self.stackView.addArrangedSubview(self.strIngredient5Label)
            self.stackView.addArrangedSubview(self.strIngredient6Label)
            self.stackView.addArrangedSubview(self.strIngredient7Label)
            self.stackView.addArrangedSubview(self.strIngredient8Label)
            self.stackView.addArrangedSubview(self.strIngredient9Label)
            self.stackView.addArrangedSubview(self.strIngredient10Label)
            self.stackView.addArrangedSubview(self.strIngredient11Label)
            self.stackView.addArrangedSubview(self.strIngredient12Label)
            self.stackView.addArrangedSubview(self.strIngredient13Label)
            self.stackView.addArrangedSubview(self.strIngredient14Label)
            self.stackView.addArrangedSubview(self.strIngredient15Label)
            self.stackView.addArrangedSubview(self.strIngredient16Label)
            self.stackView.addArrangedSubview(self.strIngredient17Label)
            self.stackView.addArrangedSubview(self.strIngredient18Label)
            self.stackView.addArrangedSubview(self.strIngredient19Label)
            self.stackView.addArrangedSubview(self.strIngredient20Label)
            self.stackView.addArrangedSubview(self.strMeasure1Label)
            self.stackView.addArrangedSubview(self.strMeasure2Label)
            self.stackView.addArrangedSubview(self.strMeasure3Label)
            self.stackView.addArrangedSubview(self.strMeasure4Label)
            self.stackView.addArrangedSubview(self.strMeasure5Label)
            self.stackView.addArrangedSubview(self.strMeasure6Label)
            self.stackView.addArrangedSubview(self.strMeasure7Label)
            self.stackView.addArrangedSubview(self.strMeasure8Label)
            self.stackView.addArrangedSubview(self.strMeasure9Label)
            self.stackView.addArrangedSubview(self.strMeasure10Label)
            self.stackView.addArrangedSubview(self.strMeasure11Label)
            self.stackView.addArrangedSubview(self.strMeasure12Label)
            self.stackView.addArrangedSubview(self.strMeasure13Label)
            self.stackView.addArrangedSubview(self.strMeasure14Label)
            self.stackView.addArrangedSubview(self.strMeasure15Label)
            self.stackView.addArrangedSubview(self.strMeasure16Label)
            self.stackView.addArrangedSubview(self.strMeasure17Label)
            self.stackView.addArrangedSubview(self.strMeasure18Label)
            self.stackView.addArrangedSubview(self.strMeasure19Label)
            self.stackView.addArrangedSubview(self.strMeasure20Label)
            self.stackView.addArrangedSubview(self.strSourceLabel)
            self.stackView.addArrangedSubview(self.strImageSourceLabel)
            self.stackView.addArrangedSubview(self.strCreativeCommonsConfirmedLabel)
            self.stackView.addArrangedSubview(self.dateModifiedLabel)
            NSLayoutConstraint.activate([
                self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
                self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
                self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20),
                self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant:  -20),
                self.stackView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1),
                self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
                self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 200),
                self.strMealThumbImage.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.2),
                self.strMealThumbImage.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.8),
                self.strInstructionsView.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.2),
                self.strInstructionsView.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 1)
            ])
            self.idMealLabel.text = fetchedMeal.idMeal
            self.mealNameLabel.text = fetchedMeal.strMeal
            let image = self.displayURLImage(url: fetchedMeal.strMealThumb ?? "https://www.simplystamps.com/media/catalog/product/5/8/5802-n-a-stock-stamp-hcb.png")
            self.strMealThumbImage.image = image
            self.strDrinkAlternateLabel.text = fetchedMeal.strDrinkAlternate
            self.strCategoryLabel.text = fetchedMeal.strCategory
            self.strAreaLabel.text = fetchedMeal.strArea
            self.strInstructionsView.text = fetchedMeal.strInstructions
            self.strTagsLabel.text = fetchedMeal.strTags
            self.strYoutubeLabel.text = fetchedMeal.strYoutube
            self.strIngredient1Label.text = fetchedMeal.strIngredient1
            self.strIngredient2Label.text = fetchedMeal.strIngredient2
            self.strIngredient3Label.text = fetchedMeal.strIngredient3
            self.strIngredient4Label.text = fetchedMeal.strIngredient4
            self.strIngredient5Label.text = fetchedMeal.strIngredient5
            self.strIngredient6Label.text = fetchedMeal.strIngredient6
            self.strIngredient7Label.text = fetchedMeal.strIngredient7
            self.strIngredient8Label.text = fetchedMeal.strIngredient8
            self.strIngredient9Label.text = fetchedMeal.strIngredient9
            self.strIngredient10Label.text = fetchedMeal.strIngredient10
            self.strIngredient11Label.text = fetchedMeal.strIngredient11
            self.strIngredient12Label.text = fetchedMeal.strIngredient12
            self.strIngredient13Label.text = fetchedMeal.strIngredient13
            self.strIngredient14Label.text = fetchedMeal.strIngredient14
            self.strIngredient15Label.text = fetchedMeal.strIngredient15
            self.strIngredient16Label.text = fetchedMeal.strIngredient16
            self.strIngredient17Label.text = fetchedMeal.strIngredient17
            self.strIngredient18Label.text = fetchedMeal.strIngredient18
            self.strIngredient19Label.text = fetchedMeal.strIngredient19
            self.strIngredient20Label.text = fetchedMeal.strIngredient20
            self.strMeasure1Label.text = fetchedMeal.strMeasure1
            self.strMeasure2Label.text = fetchedMeal.strMeasure2
            self.strMeasure3Label.text = fetchedMeal.strMeasure3
            self.strMeasure4Label.text = fetchedMeal.strMeasure4
            self.strMeasure5Label.text = fetchedMeal.strMeasure5
            self.strMeasure6Label.text = fetchedMeal.strMeasure6
            self.strMeasure7Label.text = fetchedMeal.strMeasure7
            self.strMeasure8Label.text = fetchedMeal.strMeasure8
            self.strMeasure9Label.text = fetchedMeal.strMeasure9
            self.strMeasure10Label.text = fetchedMeal.strMeasure10
            self.strMeasure11Label.text = fetchedMeal.strMeasure11
            self.strMeasure12Label.text = fetchedMeal.strMeasure12
            self.strMeasure13Label.text = fetchedMeal.strMeasure13
            self.strMeasure14Label.text = fetchedMeal.strMeasure14
            self.strMeasure15Label.text = fetchedMeal.strMeasure15
            self.strMeasure16Label.text = fetchedMeal.strMeasure16
            self.strMeasure17Label.text = fetchedMeal.strMeasure17
            self.strMeasure18Label.text = fetchedMeal.strMeasure18
            self.strMeasure19Label.text = fetchedMeal.strMeasure19
            self.strMeasure20Label.text = fetchedMeal.strMeasure20
            self.strSourceLabel.text = fetchedMeal.strSource
            self.strImageSourceLabel.text = fetchedMeal.strImageSource
            self.strCreativeCommonsConfirmedLabel.text = fetchedMeal.strCreativeCommonsConfirmed
            self.dateModifiedLabel.text = fetchedMeal.dateModified
        }
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
