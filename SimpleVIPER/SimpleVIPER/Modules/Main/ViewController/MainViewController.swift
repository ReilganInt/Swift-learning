//
//  MainViewController.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, MainViewProtocol {
    
    var randomButton: UIButton!
    var newsButton: UIButton!
    var dishButton: UIButton!
    let activityIndicator = UIActivityIndicatorView(style: .large)

    weak var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Test"
        view.backgroundColor = .white
        configurator.configure(with: self)
        presenter.configureView()
        
    }
    
    // MARK: - Action methods
    
    @objc private func randomButtonClicked() {
        presenter.randomButtonClicked()
    }
    
    @objc private func newsButtonClicked() {
        presenter.newsButtonClicked()
    }
    
    @objc private func dishButtonClicked() {
        presenter.dishButtonClicked()
    }
    
    
    // MARK: - MainViewProtocol methods
    
    func setRandomButton(with titleString: String?) {
        DispatchQueue.main.async {
            self.randomButton = UIButton(type: .system)
            self.view.addSubview(self.randomButton)
            self.randomButton.setTitle(titleString, for: .normal)
            self.randomButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(300)
            }
            self.randomButton.addTarget(self, action: #selector(self.randomButtonClicked), for: .touchUpInside)
        }
    }
    
    func setNewsButton(with titleString: String?) {
        DispatchQueue.main.async {
            self.newsButton = UIButton(type: .system)
            self.view.addSubview(self.newsButton)
            self.newsButton.setTitle(titleString, for: .normal)
            self.newsButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(400)
            }
            self.randomButton.addTarget(self, action: #selector(self.newsButtonClicked), for: .touchUpInside)
        }
    }
    
    func setDishButton(with titleString: String?) {
        DispatchQueue.main.async {
            self.dishButton = UIButton(type: .system)
            self.view.addSubview(self.dishButton)
            self.dishButton.setTitle(titleString, for: .normal)
            self.dishButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(500)
            }
            self.randomButton.addTarget(self, action: #selector(self.dishButtonClicked), for: .touchUpInside)
        }
    }
    
    func setActivityIndicator() {
        DispatchQueue.main.async {
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.backgroundColor = .clear
            self.activityIndicator.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    }
    
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: text, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showSpinner() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    // MARK: - Navigation methods
    
    
}
