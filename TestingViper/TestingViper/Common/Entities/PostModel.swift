//
//  PostModel.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

struct PostsModel: PostsModelProtocol, Decodable {
    var posts: [PostModel] = []
    
    enum PostsCodingKeys: String, CodingKey {
        case posts
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PostsCodingKeys.self)
        self.posts = try container.decode([PostModel].self, forKey: .posts)
    }
}

struct PostModel: PostModelProtocol, Decodable {
    var title = ""
    var imageURLString = ""
    
    enum DishCodingKeys: String, CodingKey {
        case title
        case imageURLString
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DishCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageURLString = try container.decode(String.self, forKey: .imageURLString)
    }
    
    init(title: String, imageURLString: String) {
        self.title = title
        self.imageURLString = imageURLString
    }
}
