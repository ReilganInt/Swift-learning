//
//  NetworkManagerProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol NetworkManagerInputProtocol: class {
    
    var networkRequestHandler: NetworkManagerOutputProtocol? { get set }
    
    // Interactor -> NetworkManager
    func retrievePostList(for type: Endpoints.Posts)
}

protocol NetworkManagerOutputProtocol: class {
    
    // NetworkManager -> Interactor
    func onPostsRetrieved(_ posts: [PostModel])
    func onError(with text: String)
}
