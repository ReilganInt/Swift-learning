//
//  MainConfigurator.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: MainViewController) {
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol & NetworkManagerOutputProtocol = MainInteractor()
        let router: MainRouterProtocol = MainRouter()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
