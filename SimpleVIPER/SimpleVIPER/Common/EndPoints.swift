//
//  EndPoints.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = "https://firebasestorage.googleapis.com/v0/b/posts-54147.appspot.com/o"
}

enum EndPoints {
    enum Posts: EndPoint {
        case dish
        case news
        
        public var url: String {
            switch self {
            case .dish:
                return "\(API.baseURL)/dish.json?alt=media&token="
            case .news:
                return "\(API.baseURL)/news.json?alt=media&token="
            }
        }
    }
}
