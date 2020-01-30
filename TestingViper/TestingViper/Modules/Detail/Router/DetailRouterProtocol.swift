//
//  DetailRouterProtocol.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol DetailRouterProtocol: class {
    
    // Presenter -> Router
    func pop(from view: DetailViewProtocol)
}
