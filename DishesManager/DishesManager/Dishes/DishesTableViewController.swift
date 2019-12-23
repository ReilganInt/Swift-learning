//
//  DishesTableViewController.swift
//  DishesManager
//
//  Created by admin on 20/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class DishesTableViewController: UITableViewController {
    
    //MARK: Properties

    var manager: Manager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NotificationConstants.dishesDidLoad, object: nil)
        manager = Manager()
        manager?.loadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager?.getDishesCount() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dishesIdentiferCell = DishesTableViewCell.identiferCell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dishesIdentiferCell, for: indexPath) as? DishesTableViewCell else {
            return UITableViewCell()
        }
        
        guard let item = manager?.getItem(for: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.description
        cell.photoImageView.image = UIImage(named: item.image)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = manager?.getItem(for: indexPath.row) else { return }
        guard let vc = storyboard?.instantiateViewController(identifier: StoryboardIdConstants.detail) as? DetailViewController else {
            return
        }
        vc.dish = data
        navigationController?.pushViewController(vc, animated: true)
        
        
        // navigation controller (push, pop)
        // present
        // navigationBar (navigationItem)
        
        // tapBarViewController (little bit)
        
    }


    @objc func test(){
        debugPrint("TEST!!!!!!!!!!!!!!!!!\n\n\n\n\n")
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.dish = manager?.getItem(for: (tableView?.indexPathForSelectedRow!.row)!)
        }
    }

}

