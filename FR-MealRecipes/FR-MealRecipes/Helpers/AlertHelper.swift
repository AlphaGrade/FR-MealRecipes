//
//  AlertHelper.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/3/21.
//

import UIKit

extension UIViewController {
// Alert code that alerts user of something. Input params title and message
   func alertMessage(title: String, message: String) {

       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
   }
    
}
