//
//  DetailInteractorProtocol.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor
}

protocol DetailInteractorOutputProtocol: class {
    
    // Interactor -> Presenter
    func onError(with text: String)
}
