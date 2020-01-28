//
//  MainPresenterProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: class {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func showPosts(from view: MainViewProtocol, with posts: [PostModel])
    func showAlertView(with text: String)
    func randomButtonClicked()
    func newsButtonClicked()
    func dishButtonClicked()
}
