//
//  Router.swift
//  LovelyFood
//
//  Created by admin on 17.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

struct Router: URLRouter {

    static var basePath: String {
        return "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/new.json?alt=media&token=87911f73-1e53-4d62-8035-afd441afa8a4"
    }
    
    struct Dish: Readable {
        var route: String = "dishes"
    }
    
    struct Status: Readable {
        var route: String = "statuses"
    }
}


