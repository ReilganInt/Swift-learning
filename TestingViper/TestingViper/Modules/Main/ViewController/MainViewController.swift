//
//  MainViewController.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    weak var presenter: MainPresenterProtocol?
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    
    // MARK: - UI properties
    
    var randomButton: UIButton!
    var newsButton: UIButton!
    var dishButton: UIButton!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.viewDidLoad()
        
    }

}

extension MainViewController: MainViewProtocol {
    
    // MARK: - MainViewProtocol methods
    
    func showError() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: "Internet not connected", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    
    
}
