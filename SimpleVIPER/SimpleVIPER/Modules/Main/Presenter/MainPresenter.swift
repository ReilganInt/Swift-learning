//
//  MainPresenter.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    // MARK: - MainPresenterProtocol methods
    
    func configureView() {
        view?.setRandomButton(with: "Random")
        view?.setNewsButton(with: "News")
        view?.setDishButton(with: "Dish")
        view?.setActivityIndicator()
    }
    
    
    func randomButtonClicked() {
        view?.showSpinner()
        interactor.openRandomView()
        view?.hideSpinner()
    }
    
    func newsButtonClicked() {
        view?.showSpinner()
        interactor.openNewsView()
    }
    
    func dishButtonClicked() {
        view?.showSpinner()
        interactor.openDishView()
    }
}

protocol MainInteractorOutputProtocol {
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}

extension MainPresenter: MainInteractorOutputProtocol {
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideSpinner()
        
    }
    
    func onError() {
        view?.hideSpinner()
        view?.showAlertView(with: "Internet not connected")
    }
    
    
}
