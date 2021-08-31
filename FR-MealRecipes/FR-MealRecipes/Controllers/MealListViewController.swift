//
//  MealListViewController.swift
//  FR-MealRecipes
//
//  Created by Joe on 8/30/21.
//
import CoreData
import UIKit

class MealListViewController: UIViewController {
    
    let apiController = APIController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal List"
        apiController.fetchCategories()
    }
}


extension MealListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
