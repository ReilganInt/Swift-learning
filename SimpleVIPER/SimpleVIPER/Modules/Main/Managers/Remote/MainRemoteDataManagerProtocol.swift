//
//  MainRemoteDataManagerProtocol.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol? { get set }
    func retrievePostList(with type: EndPoint)
}

protocol MainRemoteDataManagerOutputProtocol: class {
    func onPostsRetrieved(_ posts: [PostModel])
    func onError()
}
