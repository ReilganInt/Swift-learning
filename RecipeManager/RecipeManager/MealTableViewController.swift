//
//  MealTableViewController.swift
//  RecipeManager
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    //MARK:  - Properties
    
    // manager: RecipeManager
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    
    var isEditingRecipe: Bool = false
    var editingRecipeRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // manage = RecipeManager()

        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        if let path = Bundle.main.path(forResource: "Dishes", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                  debugPrint(jsonResult)
                
                
                
              } catch {
                   // handle error
              }
        }
        
        // Load Sample Recipes 
        loadSampleRecipes()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5 //meal.count
    }
    
    /*
        создаем нотификацию (почитать) и вызываем функцию update()
     
     */

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeIdentiferCell = "recipeIdentiferCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: recipeIdentiferCell, for: indexPath) as? MealTableViewCell else {
            return UITableViewCell()
        }
        
//        let item = manager.getItem(for: indexPath.row)
//        cell.nameLabel.text =
//        cell.descriptionLabel.text = item.description
//        cell.photoImageView.image = item.image

        return cell
    }
    

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // meal.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailViewController, let recipe = sourceViewController.meal {
            
            if isEditingRecipe {
                if editingRecipeRow != nil {
                    //meal[editingRecipeRow!] = recipe
                    isEditingRecipe = false
                    editingRecipeRow = nil
                    tableView.reloadData()
                }
            } else {
            
                // Add a new recipe
                // let newIndexPath = IndexPath(row: meal.count, section: 0)
                
              //  meal.append(recipe)
              //  tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

    
    // MARK: - Navigation
    
    let segueIdentifier = "detailIdentifier"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let idItem = tableView.indexPathForSelectedRow?.row {
//                (segue.destination as? DetailViewController)?.meal = meal[idItem]
                isEditingRecipe = true
                editingRecipeRow = idItem
            }
        }
    }
    
    //MARK: - Private Methods
    
    private func loadSampleRecipes() {
        
//        var dishes = [Meal]()
//
//        var recipe1 = Meal()
//        var recipe2 = Meal()
//        var recipe3 = Meal()
//
        
        
//        dishes += [recipe1, recipe2, recipe3]

    }

}
