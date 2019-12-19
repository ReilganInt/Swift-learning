//
//  RecipesTableViewController.swift
//  RecipeManager
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    //MARK:  - Properties
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes = [Recipe]()
    var isEditingRecipe: Bool = false
    var editingRecipeRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        // Load Sample Recipes
        loadSampleRecipes()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeIdentiferCell = "recipeIdentiferCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: recipeIdentiferCell, for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        let item = recipes[indexPath.row]
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.description
        cell.photoImageView.image = item.image

        return cell
    }
    

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailViewController, let recipe = sourceViewController.recipe {
            
            if isEditingRecipe {
                if editingRecipeRow != nil {
                    recipes[editingRecipeRow!] = recipe
                    isEditingRecipe = false
                    editingRecipeRow = nil
                    tableView.reloadData()
                }
            } else {
            
                // Add a new recipe
                let newIndexPath = IndexPath(row: recipes.count, section: 0)
                
                recipes.append(recipe)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

    
    // MARK: - Navigation
    
    let segueIdentifier = "detailIdentifier"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let idItem = tableView.indexPathForSelectedRow?.row {
                (segue.destination as? DetailViewController)?.recipe = recipes[idItem]
                isEditingRecipe = true
                editingRecipeRow = idItem
            }
        }
    }
    
    //MARK: - Private Methods
    
    private func loadSampleRecipes() {
        
        let photo1 = UIImage(named: "carbonara")
        let photo2 = UIImage(named: "cheesecake")
        let photo3 = UIImage(named: "pizza")
        
        guard let recipe1 = Recipe(name: "Carbonara", description: "Just a handful of ingredients makes a fantastic carbonara and, done properly, it’s a thing of beauty.", image: photo1) else {
            fatalError("Unable to instantiate recipe1") }
        guard let recipe2 = Recipe(name: "Cheesecake", description: "Cheesecake is a sweet dessert consisting of one or more layers.", image: photo2) else {
            fatalError("Unable to instantiate recipe2") }
        guard let recipe3 = Recipe(name: "Pizza", description: "Pizza is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients", image: photo3) else {
            fatalError("Unable to instantiate recipe3") }
        
        recipes.append(recipe1)
        recipes.append(recipe2)
        recipes.append(recipe3)
    }

}
