//
//  DataBaseManagerProtocol.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol DataBaseManagerInputProtocol: class {
    
    // Interactor -> DataBaseManager
    
    func retrievePostList(for type: Endpoints.Posts) throws -> [Post]
    func savePost(title: String, imageURLString: String, text: String) throws
}

protocol DataBaseManagerOutputProtocol: class {
    
}
