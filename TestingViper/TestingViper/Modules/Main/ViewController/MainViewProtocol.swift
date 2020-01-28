//
//  MainViewProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    
    var presenter: MainPresenterProtocol? { get set }
    
    func configureView()
    
    // Presenter -> ViewController
    
    func showLoading()
    func hideLoading()
    func showAlertView(with text: String)
    
}
