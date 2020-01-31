//
//  PostModel.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

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

struct PostModel: PostModelProtocol, Decodable, Hashable {
    var title = ""
    var imageURLString = ""
    var text = ""
    var identifier: Int!
    
    enum DishCodingKeys: String, CodingKey {
        case title
        case imageURLString
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DishCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.imageURLString = try container.decode(String.self, forKey: .imageURLString)
        self.text = try container.decode(String.self, forKey: .text)
        self.identifier = hashValue
    }
    
    init(title: String?, imageURLString: String?, text: String?) {
        self.title = title ?? ""
        self.imageURLString = imageURLString ?? ""
        self.text = text ?? ""
        self.identifier = hashValue
    }
    
}

extension PostModel: ManagedObjectConvertible {
    
    func toManagedObject(in context: NSManagedObjectContext, with type: Endpoints.Posts) -> NSManagedObject? {
        switch type {
        case .dish:
            let dish = DishMO(context: context)
            dish.title = title
            dish.imageURLString = imageURLString
            dish.text = text
            dish.identifier = Int64(exactly: identifier) ?? 0
            return dish
        case .news:
            let news = NewsMO(context: context)
            news.title = title
            news.imageURLString = imageURLString
            news.text = text
            news.identifier = Int64(exactly: identifier) ?? 0
            return news
        }
    }
}
