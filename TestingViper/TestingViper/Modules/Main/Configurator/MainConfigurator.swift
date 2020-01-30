//
//  MainConfigurator.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class MainConfigurator: MainConfiguratorProtocol {
    
    static func createMainModule() -> UIViewController {
        let viewController = MainViewController()
        
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interator: MainInteractorInputProtocol & NetworkManagerOutputProtocol = MainInteractor()
        let newsDatabaseManager: CoreDataManager<NewsMO, PostModel>? = CoreDataManager()
        let dishDatabaseManager: CoreDataManager<DishMO, PostModel>? = CoreDataManager()
        let networkManager:NetworkManagerInputProtocol = NetworkManager()
        let router: MainRouterProtocol = MainRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interator
        interator.presenter = presenter
        interator.newsDatabaseManager = newsDatabaseManager
        interator.dishDatabaseManager = dishDatabaseManager
        interator.networkManager = networkManager
        networkManager.networkRequestHandler = interator
        return viewController
    }
    
}
