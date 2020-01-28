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
    var dataBaseManager: DataBaseManagerInputProtocol? { get set }
    var networkManager: NetworkManagerInputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrievePostList(for type: Endpoints.Posts)
}

protocol MainInteractorOutputProtocol: class {
    
    // Interactor -> Presenter
    func didRetrievePosts(_ posts: [PostModel])
    func onError(with text: String)
}
