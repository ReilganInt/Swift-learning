//
//  MainInteractor.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    
    // MARK: - Properties
    
    var presenter: MainInteractorOutputProtocol?
    var dataBaseManager: DataBaseManagerInputProtocol?
    var networkManager: NetworkManagerInputProtocol?
    
    // MARK: - MainInteractorInputProtocol methods
    
    func retrievePostList(for type: Endpoints.Posts) {
        do {
            if let postList = try dataBaseManager?.retrievePostList(for: type) {
                let postModelList = postList.map() {
                    return PostModel(title: $0.title!, imageURLString: $0.imageURLString!, text: $0.text!)
                }
                if postModelList.isEmpty {
                    networkManager?.retrievePostList(for: type)
                } else {
                    presenter?.didRetrievePosts(postModelList)
                }
            } else {
                networkManager?.retrievePostList(for: type)
            }
        } catch {
            presenter?.onError(with: "No internet connection. No data in local data base. :(")
        }
       
    }
    
}

extension MainInteractor: NetworkManagerOutputProtocol {
    
    // MARK: - NetworkManagerOutputProtocol methods
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
    }
    
    func onError(with text: String) {
        presenter?.onError(with: text)
    }
    
}
