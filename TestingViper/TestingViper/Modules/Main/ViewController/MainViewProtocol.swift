//
//  MainViewProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showError()
    func showLoading()
    func hideLoading()
}
