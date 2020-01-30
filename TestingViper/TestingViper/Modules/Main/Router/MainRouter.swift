//
//  MainRouter.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    // MARK: - MainRouterProtocol mathods
    
    func showPosts(from view: MainViewProtocol, with posts: [PostModel]) {
        let detailViewController = DetailConfigurator.createDetailModule()
        if let detailView = detailViewController as? DetailViewProtocol {
            detailView.posts = posts
        }
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}



















//class MainRouter: MainRouterProtocol {
//
//    func presentPostsScreen(from view: MainViewProtocol, forPosts posts: [PostModel]) {
////        let detailViewController = DetailViewController()
////        detailViewController.configure(with: self)
////        if let sourceView = view as? MainViewController {
////            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
////        }
//    }
//
//}
