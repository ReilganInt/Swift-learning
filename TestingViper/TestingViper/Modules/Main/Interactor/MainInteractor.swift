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
    var newsDatabaseManager: CoreDataManager<NewsMO, PostModel>?
    var dishDatabaseManager: CoreDataManager<DishMO, PostModel>?
    var networkManager: NetworkManagerInputProtocol?
    
    // MARK: - MainInteractorInputProtocol methods
    
    func retrievePostList(for type: Endpoints.Posts) {
            networkManager?.retrievePostList(for: type)
    }
}

extension MainInteractor: NetworkManagerOutputProtocol {
    
    // MARK: - NetworkManagerOutputProtocol methods
    
    func onPostsRetrieved(_ posts: [PostModel], for type: Endpoints.Posts) {
        presenter?.didRetrievePosts(posts, for: type)
        
        switch type {
        case .dish:
            dishDatabaseManager?.save(entities: posts, with: type, completion: { error in
                guard let error = error else { return }
                print("\(error)")
            })
        case .news:
            newsDatabaseManager?.save(entities: posts, with: type, completion: { error in
                guard let error = error else { return }
                print("\(error)")
            })
        }
    }
    
    func onError(with text: String) {
        presenter?.onError(with: text)
    }
}
        
        
