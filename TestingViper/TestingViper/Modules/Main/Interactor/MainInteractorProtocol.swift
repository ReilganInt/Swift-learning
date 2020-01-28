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
//    var dataBaseManager: DataBaseManagerInputProtocol? { get set }
    var networkManager: NetworkManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrievePostList()
}

protocol MainInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}
