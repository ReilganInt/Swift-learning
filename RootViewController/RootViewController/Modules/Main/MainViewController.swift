//
//  MainViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

// Задания:

// Подключить alamofire         - Solved
// Сделать загрузку через него  - Solved
// DetailVC autolayouts         - Solved

// SnapKit install              - Solved
// DishesTableViewCell сделать при помощи snapKit - Solved
// DetailVC при помощи snapKit  - Solved
// Нажимать на content table view cell (clips to bounds) - ...

// Подключить coreData
// Вести запись блюд, в первую очередь качать блюда из локального хранилища


class MainViewController: UIViewController{

    //MARK: Properties
    
    var manager: Manager?
    
    var safeArea: UILayoutGuide!
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.3)
        return activityIndicator
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NotificationConstants.URLSessinHasError, object: nil)
        NotificationCenter.default.removeObserver(self, name: NotificationConstants.dataLoaded, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addNewDishButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDish))
        
        title = "Main Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setRightBarButton(addNewDishButton, animated: true)
        navigationItem.hidesBackButton = true
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        // Notification Center
        NotificationCenter.default.addObserver(self, selector: #selector(errorAlert), name: NotificationConstants.URLSessinHasError, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NotificationConstants.dataLoaded, object: nil)

        // AddSubviews
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        // ActivityIndicator
        activityIndicator.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        makeServiceCall()
        setupTableView()
    }
    
    // TODO: Функция для добавления нового блюда на главный экран
    @objc func addNewDish() {
            
    }
    
    // TODO: func errorAlert(message: String)
    @objc func errorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "URLSession has some error", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        activityIndicator.stopAnimating()
        self.present(alertController, animated: true, completion: nil)
        
        return
    }
    
    @objc func reloadData() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    //MARK: - Private Methods
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DishesTableViewCell.self, forCellReuseIdentifier: DishesTableViewCell.cellId)

        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeArea)
        }
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        manager = Manager()
        manager?.loadData()
    }
}

//MARK: Table View Data Source, Table View Delegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager?.getDishesCounr() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishesTableViewCell.cellId, for: indexPath) as? DishesTableViewCell else {
            return UITableViewCell()
        }
        
        guard let item = manager?.getItem(for: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.imageIV.image = UIImage(named: item.image) ?? UIImage(named: "notFound")
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = item.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = manager?.getItem(for: indexPath.row) else { return }
         tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.dish = data
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:  Delegate method
extension MainViewController: DetailDelegate {

    func sentMessageToChangeTitle() {
        navigationItem.title = "New title"
    }
}
