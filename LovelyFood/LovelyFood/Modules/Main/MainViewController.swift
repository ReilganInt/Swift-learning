//
//  MainViewController.swift
//  LovelyFood
//
//  Created by admin on 17.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit
import CoreData

class MainViewController: UIViewController {
    
    var safeArea: UILayoutGuide?
    var tableView = UITableView()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        MainManager.shared.fetchData(dataIsLoaded: { [weak self] loaded in
            loaded ? self?.tableView.reloadData() : print("failure")
            self?.activityIndicator.stopAnimating()
        })
  
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Lovely Food"
        safeArea = view.layoutMarginsGuide
        
        let addNew = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newDish))
        
        navigationItem.setRightBarButton(addNew, animated: true)
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        activityIndicator.backgroundColor = .clear
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellID)
        tableView.snp.makeConstraints { make in
               make.edges.equalTo(safeArea ?? view)
        }
    }
    
    // MARK: - Objective-C Private Methods
    
    @objc private func newDish() {
        
        let alert = UIAlertController(title: "New Dish", message: "Add a new dish", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            
//            guard let nameTextField = alert.textFields?.first, let nameToSave = nameTextField.text else { return }
            
//            guard let descriptionTextField = alert.textFields?.last, let descriptionToSave = descriptionTextField.text else { return }
            
//            self?.coreDataManager.save(name: nameToSave, description: descriptionToSave)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainManager.shared.getDishesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        guard let item = MainManager.shared.getItem(for: indexPath.row) else { return UITableViewCell() }
        
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.description
        cell.photoImageView.image = item.image as? UIImage 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            coreDataManager.delete(at: indexPath.row)
            MainManager.shared.deleteItem(for: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

