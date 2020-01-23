//
//  Router.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Alamofire

struct Router: URLRouter {

    static var basePath: String {
        return "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/new.json?alt=media&token=f1e28918-376e-432f-b10f-ba471f78f920"
    }
    
    struct Dish: Readable {
        var route: String = "dishes"
    }
    
    struct Status: Readable {
        var route: String = "statuses"
    }
}
