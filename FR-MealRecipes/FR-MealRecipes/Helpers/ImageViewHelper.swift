//
//  ImageViewHelper.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

extension UIViewController {
    func displayURLImage(url: String) -> UIImage {
        do
        {
            let imageURL = URL(string: url)!
            let data = try Data(contentsOf: imageURL)
            let image = UIImage(data: data)
            return image ?? UIImage(named: "NotAvailable.png")!
        } catch {
            print("There was an error: \(error)")
            alertMessage(title: "Error Displaying Image", message: "There was an error pulling up image: \(error)")
            return UIImage(named: "NotAvailable.png")!
        }
    }
}
