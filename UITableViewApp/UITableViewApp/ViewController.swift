//
//  ViewController.swift
//  UITableViewApp
//
//  Created by admin on 18/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

/*
 reloadData()
 visibleCells
 IndexPath (row/sections summary)
 contentView, reuseIdentifier, reusable (UITableViewCell)
 
 'UITableViewDataSource, UITableViewDelegate
 */
var data : [[String?]]= [["Dota 2", "Description of dota 2", "dota-2.png"],
            ["Dota", "Description of dota", "dota.png"],
            ["Don't Starve", "Description of Don't Starve", "trees.png"],
            ["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
            ["Minecraft", "Description of Minecraft", "minecraft"],
            ["Dota", "Description of dota", "dota.png"],
            ["Don't Starve", "Description of Don't Starve", "trees.png"],
            ["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
            ["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["!!!!!!!!!!!!!!!!!!!!!!!!!!", "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", ""],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["111111", "", ""],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"],
["Dota", "Description of dota", "dota.png"],
["Don't Starve", "Description of Don't Starve", "trees.png"],
["Counter Strike: Go", "Description of Counter Strike: Go", "handgun.png"],
["Minecraft", "Description of Minecraft", "minecraft"]]

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let idCell = "gameCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
//        tableView.isEditing = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeMore = UIContextualAction(style: .normal, title: "More") {(action, view, success) in
            
        }
        swipeMore.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let swipeDel = UIContextualAction(style: .destructive, title: "Delete") {(action, view, success) in
            data.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        swipeDel.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [swipeDel, swipeMore])
    }
    


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        data.first![2] = nil
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? GameTableViewCell else { return UITableViewCell() }
        //let item = data[indexPath.row]
        cell.nameLabel.text = data[indexPath.item][0]
        cell.descriptionLabel.text = data[indexPath.item][1]
        cell.logoImageView.image = UIImage(named: data[indexPath.item][2])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}


