//
//  ImageViewHelper.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

extension UITableViewCell {
    func displayURLImage(url: String) -> UIImage {
        let imageURL = URL(string: url)!
        let data = try? Data(contentsOf: imageURL)
        let image = UIImage(data: data!)
        return image ?? UIImage(named: "notAvailable.jpg")!
    }
}
