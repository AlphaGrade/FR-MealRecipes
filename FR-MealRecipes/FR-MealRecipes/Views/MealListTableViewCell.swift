//
//  MealListTableViewCell.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

class MealListTableViewCell: UITableViewCell {
    
    var meal: Meal? {
        didSet {
//            updateViews()
        }
    }
    let cellView = UIView()
    lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var mealImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func updateViews() {
//        guard let meal = meal else { return }
//        contentView.addSubview(mealNameLabel)
//        contentView.addSubview(mealImage)
//        // Meal Name Label
//        mealNameLabel.text = meal.strMeal
//        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        // Meal Image
//        let image = displayURLImage(url: meal.strMealThumb ?? "https://www.simplystamps.com/media/catalog/product/5/8/5802-n-a-stock-stamp-hcb.png")
//        mealImage.image = image
//        mealImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate ([
//            mealNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            mealNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            mealImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            mealImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            mealImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            mealImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
//        ])
//    }

}
