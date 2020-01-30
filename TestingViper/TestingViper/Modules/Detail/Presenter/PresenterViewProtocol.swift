//
//  PresenterViewProtocol.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func pop(from view: DetailViewProtocol)
    func showAlertView(with text: String)
}
