//
//  DetailPresenter.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Properties
    
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    // MARK: - DetailPresenterProtocol methods
    
    func viewDidLoad() {
        
    }
    
    func pop(from view: DetailViewProtocol) {
        router?.pop(from: view)
    }
    
    func showAlertView(with text: String) {
        
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
    // MARK: - DetailInteractorOutputProtocol methods
    
    func onError(with text: String) {
        
    }
    
}
