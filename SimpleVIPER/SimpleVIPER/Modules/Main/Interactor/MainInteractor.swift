//
//  MainInteractor.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainInteractorOutputProtocol?
    
    let remoteDataManager: MainRemoteDataManagerInputProtocol = MainRemoteDataManager()
//    let localDataManager: MainLocalDataManagerProtocol = DataBaseProtocol()
    
    // MARK: - MainInteractorProtocol methods
    
    func retrievePostList(with type: EndPoint) {
        remoteDataManager.retrievePostList(with: type)
    }
    
    func openRandomView() {
        retrievePostList(with: EndPoints.Posts.dish)
    }
    
    func openNewsView() {
        retrievePostList(with: EndPoints.Posts.news)
        //
    }
    
    func openDishView() {
        //
    }
    
}

extension MainInteractor: MainRemoteDataManagerOutputProtocol {
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter.didRetrievePosts(posts)
        
        for postModel in posts {
            
        }
    }
    
    func onError() {
        presenter.onError()
    }
    
    
}
