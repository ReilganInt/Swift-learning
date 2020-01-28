//
//  DetailConfigurator.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class DetailConfigurator: DetailConfiguratorProtocol {
    
    static func createDetailModule() -> UIViewController {
        let viewController = MainViewController()
        
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interator: MainInteractorInputProtocol & NetworkManagerOutputProtocol = MainInteractor()
        let dataBaseManager: DataBaseManagerInputProtocol = DataBaseManager()
        let networkManager:NetworkManagerInputProtocol = NetworkManager()
        let router: MainRouterProtocol = MainRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interator
        interator.presenter = presenter
        interator.dataBaseManager = dataBaseManager
        interator.networkManager = networkManager
        networkManager.networkRequestHandler = interator
        return viewController
    }
    
}
