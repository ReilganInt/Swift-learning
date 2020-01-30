//
//  MainInteractorProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainInteractorInputProtocol: class {
    var presenter: MainInteractorOutputProtocol? { get set }
    var newsDatabaseManager: CoreDataManager<NewsMO, PostModel>? { get set }
    var dishDatabaseManager: CoreDataManager<DishMO, PostModel>? { get set }
    var networkManager: NetworkManagerInputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrievePostList(for type: Endpoints.Posts)
}

protocol MainInteractorOutputProtocol: class {
    
    // Interactor -> Presenter
    func didRetrievePosts(_ posts: [PostModel], for type: Endpoints.Posts)
    func onError(with text: String)
}
