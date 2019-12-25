//
//  MainViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

// https://swiftbook.ru/content/languageguide/closures/
// Удалить splashVC и добавить индикатор на mainVC
// Включить спиннер
// Скачивать данные при помощи URLSession
// Закрыть спиннер когда скачали данные или получили ошибку
// Если ошибка - выдать Алерт
// Сортировка по clouser


class MainViewController: UIViewController{

    //MARK: Properties
    
    var manager: Manager?
    
    var tableView: UITableView!
    var safeArea: UILayoutGuide!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame)

        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        tableView.dataSource = self
        tableView.delegate = self

        
        setupTableView()
        
        
        title = "Main Screen"
        
        let addNewDishButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDish))
        navigationItem.setRightBarButton(addNewDishButton, animated: true)
        
        // Временно
        navigationItem.hidesBackButton = true
    }
    
    
    @objc
        func addNewDish() {
            
        }
    
    //MARK: Table view
    
    private func setupTableView() {
        
        view.addSubview(tableView)
    
        tableView.rowHeight = 100
        tableView.register(DishesTableViewCell.self, forCellReuseIdentifier: DishesTableViewCell.cellId)
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
