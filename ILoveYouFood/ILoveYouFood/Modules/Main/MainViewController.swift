//
//  MainViewController.swift
//  ILoveYouFood
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit
import CoreData

// Переименовать CoreDataManager and NetworkServiceManager      - Solved
// Модели - одна DishManagedObject and DishModel                - Solved
// NetworkManager сделать загрузку через метод с комплишеном    - Solved
// Сначала грузим с инета данные - потом сохраняем в бд         - In queue
// Если случилась ошибка при загрузке - фетчим данные из бд     - In queue
// CoreData manager должен быть сигнлтоном                      - Solved
// MainViewController должен общаться с менеджером по протоколу - In queue
// Модели NetworkManager тоже обернуть в протокол               - In queue

class MainViewController: UIViewController {

    // MARK - Properties
    
    var coreDataManager = CoreDataManager.shared
    var networkServiceManager: NetworkServiceManager?
    
    var safeArea: UILayoutGuide?
    var tableView = UITableView()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        networkServiceManager = NetworkServiceManager()

        makeServiceCall()
        setupTableView()
    }
    
    private func update() {
        networkServiceManager?.loadData() { [weak self] dataIsLoaded in
            if dataIsLoaded {
                print("Done")
                //self?.tableView.reloadData()
            }
            else {
                print("Failure")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Private Methods
    
    private func makeServiceCall() {
        coreDataManager.fetchData()
    }
    
    private func setupTableView() {
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellID)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea ?? view)
        }
        activityIndicator.stopAnimating()
    }
    
    private func setupView() {
        
        title = "ILoveYouFood"
        view.backgroundColor = .white
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
    }
    
    // MARK: - Objective-C Private Methods
    
//    @objc private func errorAlert() {
//        let alertController = UIAlertController(title: "Error", message: "URLSession has some error", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        activityIndicator.stopAnimating()
//        present(alertController, animated: true, completion: nil)
//
//        return
//    }
//
//    @objc func reloadData() {
//
//        guard let webDishes = coreDataManager?.networkServiceManager?.getDishes() else { return }
//        for dish in webDishes {
//            coreDataManager?.save(name: dish.name, description: dish.description)
//        }
//
//        activityIndicator.stopAnimating()
//        tableView.reloadData()
//    }
    
    @objc private func newDish() {
        
        let alert = UIAlertController(title: "New Dish", message: "Add a new dish", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] action in
            
            guard let nameTextField = alert.textFields?.first, let nameToSave = nameTextField.text else { return }
            
            guard let descriptionTextField = alert.textFields?.last, let descriptionToSave = descriptionTextField.text else { return }
            
            self?.coreDataManager.save(name: nameToSave, description: descriptionToSave)
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

// MARK: - Table View Data Source

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.getDishesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        guard let item = coreDataManager.getItem(for: indexPath.row) else { return UITableViewCell() }
        
        cell.nameLabel.text = item.value(forKey: "name") as? String
        cell.descriptionLabel.text = item.value(forKey: "descript") as? String
        cell.photoImageView.image = UIImage(named: (item.value(forKey: "photo") as? String ?? "defaultPhoto"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            coreDataManager.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

