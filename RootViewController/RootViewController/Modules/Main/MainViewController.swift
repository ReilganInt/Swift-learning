//
//  MainViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

// https://swiftbook.ru/content/languageguide/closures/         - Solved,  но все равно нужно посмотреть еще видосики и пописать еще пару раз
// Удалить splashVC и добавить индикатор на mainVC              - Solved
// Включить спиннер                                             - Solved
// Скачивать данные при помощи URLSession                       - Solved
// Закрыть спиннер когда скачали данные или получили ошибку     - Solved
// Если ошибка - выдать Алерт                                   - Solved
// Сортировка по clouser                                        - Solved


class MainViewController: UIViewController{

    //MARK: Properties
    
    var manager: Manager?
    
    var safeArea: UILayoutGuide!
    var tableView: UITableView!
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        //Notification Center
        NotificationCenter.default.addObserver(self, selector: #selector(errorAlert), name: NotificationConstants.URLSessinHasError, object: nil)
        
        // AddSubviews
        tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        // ActivityIndicator
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.1)
        makeServiceCall()
        
        
        // Table view
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        
        
        title = "Main Screen"
        
        let addNewDishButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDish))
        navigationItem.setRightBarButton(addNewDishButton, animated: true)
        
        // Временно
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc func addNewDish() {
            
    }
    
    
    // func errorAlert(message: String)
    @objc func errorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "URLSession has some error", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        return
    }
    
    //MARK: - Private Methods
    
    private func setupTableView() {
    
        tableView.rowHeight = 100
        tableView.register(DishesTableViewCell.self, forCellReuseIdentifier: DishesTableViewCell.cellId)
    }
    
    private func makeServiceCall() {
        
        activityIndicator.startAnimating()
        manager = Manager()
        manager?.loadData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.tableView.reloadData()
        }
    }
    

}

//MARK: Table View Data Source

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
        
        cell.imageIV.image = UIImage(named: item.image)
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

//MARK: - Delegate method
extension MainViewController: DetailDelegate {

    func sentMessageToChangeTitle() {
        navigationItem.title = "text kek"
    }
}
