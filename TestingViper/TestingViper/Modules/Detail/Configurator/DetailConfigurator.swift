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
        let viewController = DetailViewController()
        
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interator: DetailInteractorInputProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interator
        interator.presenter = presenter
        return viewController
    }
    
}
