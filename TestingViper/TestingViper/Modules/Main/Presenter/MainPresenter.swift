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
    
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPosts(forPosts posts: [PostModel]) {
        if let view = view {
            router?.presentPostsScreen(from: view, forPosts: posts)
        }
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideLoading()
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
