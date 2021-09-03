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
    let coreDataController = CoreDataController()
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        view.addSubview(bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        bar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        return bar
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        let frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MealCell")
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        return tableView
    }()
    
    private lazy var fetchedResultsController: NSFetchedResultsController<Meal> = {
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "strMeal", ascending: true)
        ]
        let moc = CoreDataStack.shared.mainContext
        let frc = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: moc,
            sectionNameKeyPath: "strMeal",
            cacheName: nil)
        frc.delegate = self
        try? frc.performFetch()
        return frc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal List"
        apiController.fetchCategories { _ in
            self.apiController.fetchMeals(category: self.apiController.fetchedCategories)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension MealListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealListTableViewCell else { return UITableViewCell() }
        let meal = fetchedResultsController.object(at: indexPath)
        cell.meal = meal
        
        return cell
    }
}


extension MealListViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let oldIndexPath = indexPath else { return }
            guard let newIndexPath = newIndexPath else { return }
            tableView.deleteRows(at: [oldIndexPath], with: .automatic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        @unknown default: return
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {
        let sectionSet = IndexSet(integer: sectionIndex)
        switch type {
            case .insert:
                tableView.insertSections(sectionSet, with: .automatic)
            case .delete:
                tableView.deleteSections(sectionSet, with: .automatic)
        default: return
        }
    }
}
