//
//  MainInteractorProtocol.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainInteractorInputProtocol: class {
    var presenter: MainInteractorOutputProtocol? { get set }
    var dataBaseManager: MainDataBaseInputProtocol
    func openRandomView()
    func openNewsView()
    func openDishView()
    // PRESENTER -> INTERACTOR
    func retrievePostList(with type: EndPoint)
}

protocol MainInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}
