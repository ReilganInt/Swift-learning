//
//  EndPoint.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://firebasestorage.googleapis.com/v0/b/posts-54147.appspot.com/o"
}

enum Endpoints {
    
    enum Posts: Endpoint {
        case dish
        case news
        
        public var path: String {
            switch self {
            case .dish: return "/postsDish.json?alt=media&token=817cc5ed-d283-457e-97a1-f45393235a49"
            case .news: return "/postsNews.json?alt=media&token=31f9403f-1ec9-4f11-9ef6-e10dd18d20e5"
            }
        }
        
        public var url: String {
            switch self {
            case .dish: return "\(API.baseUrl)\(path)"
            case .news: return "\(API.baseUrl)\(path)"
            }
        }
        
        public var name: String {
            switch self {
            case .dish:
                return "Dish"
            case .news:
                return "News"
            }
        }
    }
}
