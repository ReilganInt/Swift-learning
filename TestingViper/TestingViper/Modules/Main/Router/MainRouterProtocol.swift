//
//  MainRouterProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainRouterProtocol: class {
    
    // Presenter -> Router
    func showPosts(from view: MainViewProtocol, with posts: [PostModel])
}



















//protocol MainRouterProtocol: class {
//
//    // PRESENTER -> Router
//    func presentPostsScreen(from view: MainViewProtocol, forPosts posts: [PostModel])
//
//}
