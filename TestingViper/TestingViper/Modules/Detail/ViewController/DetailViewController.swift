//
//  DetailViewController.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var posts: [PostModel]?
    var presenter: DetailPresenterProtocol?
    
    // MARK: - UI properties
    
    var tableView: UITableView?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc private func pop() {
        presenter?.pop(from: self)
    }
    
    // MARK: - Private methods
    
    private func setTableView() {
        tableView = UITableView()
        guard let tableView = tableView else { return }
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setView() {
        title = "DetailView"
        view.backgroundColor = .white
        let popView = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(pop))
        navigationItem.setRightBarButton(popView, animated: true)
    }
    
    
}

extension DetailViewController: DetailViewProtocol {
    
    // MARK: - DetailViewProtocol methods
    
    func configureView() {
        setView()
        setTableView()
    }
    
    func showAlertView(with text: String) {
        
    }
    
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource, UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath)
            as? DetailTableViewCell else {
                return UITableViewCell()
        }
        
        guard let item = posts?[indexPath.row] else { return UITableViewCell() }
        cell.configure(withData: item)
        return cell
    }
    
    
}
