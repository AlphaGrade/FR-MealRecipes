//
//  MealListViewController.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/30/21.
//

import UIKit

class MealListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal List"
    }
}


extension MealListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
