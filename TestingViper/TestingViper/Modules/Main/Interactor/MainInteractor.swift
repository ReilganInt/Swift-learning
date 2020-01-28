//
//  MainInteractor.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    
    weak var presenter: MainInteractorOutputProtocol?
    var networkManager: NetworkManagerInputProtocol?
    
    func retrievePostList() {
        networkManager?.retrievePostList()
    }
    
}

extension MainInteractor: NetworkManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        // save in core data
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
