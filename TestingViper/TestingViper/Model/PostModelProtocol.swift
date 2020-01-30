//
//  PostModelProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol PostModelProtocol {
    var title: String { get }
    var imageURLString: String { get }
    var text: String { get }
}

protocol PostsModelProtocol {
    var posts: [PostModel] { get }
}
