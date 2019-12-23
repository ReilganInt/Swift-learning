//
//  DetailViewController.swift
//  DishesManager
//
//  Created by admin on 23/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    var dish: Dish? = nil
    
    //MARK: Actions
    
    @IBAction func recipeButton(_ sender: Any) {
        guard let data = dish?.recipe else { return }
        guard let vc = storyboard?.instantiateViewController(identifier: StoryboardIdConstants.recipe) as? RecipeTableViewController else {
            return
        }
        vc.recipe = data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func loadData() {
        photoImageView.image = UIImage(named: dish?.image ?? "defaultPhoto")
        nameTextView.text = dish?.name
        descriptionTextView.text = dish?.description
    }

}
