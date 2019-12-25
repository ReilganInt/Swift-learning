//
//  SplashViewController.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    //MARK: Properties
    
    var manager: Manager?
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.1)
        
        manager = Manager()
        manager?.loadData()
        
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        let vc = MainViewController()
        vc.manager = manager
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}


