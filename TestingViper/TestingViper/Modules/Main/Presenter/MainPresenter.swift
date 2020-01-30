//
//  MainPresenter.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Properties
    
    var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    
    
    // MARK: - MainPresenterProtocol methods
    
    func viewDidLoad() {
        // ?
    }
    
    func showPosts(from view: MainViewProtocol, with posts: [PostModel]) {
        router?.showPosts(from: view, with: posts)
    }
    
    func showAlertView(with text: String) {
        view?.showAlertView(with: text)
    }
    
    func randomButtonClicked() {
        let random = Bool.random()
        if random {
            newsButtonClicked()
        } else {
            dishButtonClicked()
        }
    }
    
    func newsButtonClicked() {
        view?.showLoading()
        interactor?.retrievePostList(for: .news)
        
    }
    
    func dishButtonClicked() {
        view?.showLoading()
        interactor?.retrievePostList(for: .dish)
    }
    
    // MARK: - Private methods
    
}

extension MainPresenter: MainInteractorOutputProtocol {
    
    
    // MARK: - MainInteractorOutputProtocol methods
    
    func didRetrievePosts(_ posts: [PostModel], for type: Endpoints.Posts) {
        view?.hideLoading()
        DispatchQueue.main.async {
            guard let strongView = self.view else { return }
                self.showPosts(from: strongView, with: posts)
        }
    }
    
    func onError(with text: String) {
        view?.hideLoading()
        view?.showAlertView(with: text)
    }
    
    
}




















//class MainPresenter: MainPresenterProtocol {
//
//    // MARK: - Properties
//
//    weak var view: MainViewProtocol?
//    var interactor: MainInteractorInputProtocol?
//    var router: MainRouterProtocol?
//
//    // MARK: - MainPresenterProtocol methods
//
//    func viewDidLoad() {
//        view?.setButtons()
//        view?.setLoading()
//        view?.showLoading()
//        interactor?.retrievePostList()
//    }
//
//    func randomButtonClicked() {
//
//    }
//
//    func newsButtonClicked() {
//
//    }
//
//    func dishButtonClicked() {
//
//    }
//
//    func showPosts(forPosts posts: [PostModel]) {
//        if let view = view {
//            router?.presentPostsScreen(from: view, forPosts: posts)
//        }
//    }
//}
//
//extension MainPresenter: MainInteractorOutputProtocol {
//
//    func didRetrievePosts(_ posts: [PostModel]) {
//        view?.hideLoading()
//    }
//
//    func onError() {
//        view?.hideLoading()
//        view?.showError()
//    }
//
//}
