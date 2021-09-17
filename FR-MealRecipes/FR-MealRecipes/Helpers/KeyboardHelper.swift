//
//  KeyboardHelper.swift
//  FR-MealRecipes
//
//  Created by Joe on 9/17/21.
//

import UIKit
// Credit: https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
