//
//  MainViewController.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - UI Properties
    
    var randomButton: UIButton?
    var newsButton: UIButton?
    var dishButton: UIButton?
    var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Action methods
    
    @objc private func randomButtonClicked() {
        presenter?.randomButtonClicked()
    }
    
    @objc private func newsButtonClicked() {
        presenter?.newsButtonClicked()
    }
    
    @objc private func dishButtonClicked() {
        presenter?.dishButtonClicked()
    }
    
}

extension MainViewController: MainViewProtocol {
    
    // MARK: - MainViewProtocol methods
    
    func configureView() {
        setView()
        setRandomButton()
        setNewsButton()
        setDishButton()
        setActivityIndicator()
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.activityIndicator?.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
        }
    }
    
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Viper Architechture", message: text, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                // ?
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private methods
    
    private func setView() {
        view.backgroundColor = .white
        title = "Viper Architechture"
    }
    
    private func setRandomButton() {
        randomButton = UIButton(type: .system)
        if let button = randomButton {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(100)
            }
            button.setTitle("Random", for: .normal)
            button.addTarget(self, action: #selector(randomButtonClicked), for: .touchUpInside)
        }
    }
    
    private func setNewsButton() {
        newsButton = UIButton(type: .system)
        if let button = newsButton {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(200)
            }
            button.setTitle("News", for: .normal)
            button.addTarget(self, action: #selector(newsButtonClicked), for: .touchUpInside)
        }
    }
    
    private func setDishButton() {
        dishButton = UIButton(type: .system)
        if let button = dishButton {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(300)
            }
            button.setTitle("Dish", for: .normal)
            button.addTarget(self, action: #selector(dishButtonClicked), for: .touchUpInside)
        }
    }
    
    private func setActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        if let indicator = activityIndicator {
            view.addSubview(indicator)
            indicator.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    }
    
}


















//
//class MainViewController: UIViewController {
//
//    // MARK: - Properties
//
//    weak var presenter: MainPresenterProtocol?
//    let configurator: MainConfiguratorProtocol = MainConfigurator()
//
//    // MARK: - UI properties
//
//    var randomButton: UIButton?
//    var newsButton: UIButton?
//    var dishButton: UIButton?
//    let activityIndicator = UIActivityIndicatorView(style: .large)
//
//    // MARK: - Lifecycle methods
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        configurator.configure(with: self)
//        presenter?.viewDidLoad()
//
//    }
//
//    // MARK: - Action methods
//
//    @objc private func randomButtonClicked() {
//        presenter?.randomButtonClicked()
//    }
//
//    @objc private func newsButtonClicked() {
//        presenter?.newsButtonClicked()
//    }
//
//    @objc private func dishButtonClicked() {
//        presenter?.dishButtonClicked()
//    }
//
//}
//
//extension MainViewController: MainViewProtocol {
//
//    // MARK: - MainViewProtocol methods
//
//    func setButtons() {
//
//        setRandomButton()
//        setNewsButton()
//        setDishButton()
//
//    }
//
//    func setLoading() {
//        view.addSubview(activityIndicator)
//    }
//
//    func showError() {
//        DispatchQueue.main.async {
//            let alertController = UIAlertController(title: "", message: "Internet not connected", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
//
//            })
//            self.present(alertController, animated: true, completion: nil)
//        }
//    }
//
//    func showLoading() {
//        DispatchQueue.main.async {
//            self.activityIndicator.startAnimating()
//        }
//    }
//
//    func hideLoading() {
//        DispatchQueue.main.async {
//            self.activityIndicator.stopAnimating()
//        }
//    }
//
//    // MARK: - Private methods
//
//    private func setRandomButton() {
//        randomButton = UIButton(type: .system)
//        if let button = randomButton {
//            view.addSubview(button)
//            button.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(300)
//            }
//            button.addTarget(self, action: #selector(randomButtonClicked), for: .touchUpInside)
//        }
//    }
//
//    private func setNewsButton() {
//        newsButton = UIButton(type: .system)
//        if let button = newsButton {
//            view.addSubview(button)
//            button.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(400)
//            }
//            button.addTarget(self, action: #selector(newsButtonClicked), for: .touchUpInside)
//        }
//    }
//
//    private func setDishButton() {
//        dishButton = UIButton(type: .system)
//        if let button = dishButton {
//            view.addSubview(button)
//            button.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(500)
//            }
//            button.addTarget(self, action: #selector(dishButtonClicked), for: .touchUpInside)
//        }
//    }
//
//}
