//
//  RecipeTableViewController.swift
//  DishesManager
//
//  Created by admin on 23/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var recipe: [Recipe]? = nil
    var newItem: Recipe?

    //MARK: Actions
    @IBAction func addBarButtonItem(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New ingredient", message: "What you want to add?", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Add", style: .default) { (handler) in
//            newItem = Recipe()
//            print(alert.textFields![0].text!)
//            print(alert.textFields![1].text)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name ingredient"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Weight ingredient"
        }
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = RecipeTableViewCell.idCell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = recipe?[indexPath.row].name
        cell.weightLabel.text = String(format: "%.2f", recipe?[indexPath.row].weight ?? 0)

        return cell
    }

}
