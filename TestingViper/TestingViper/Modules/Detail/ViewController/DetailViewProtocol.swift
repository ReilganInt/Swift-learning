//
//  DetailViewProtocol.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    
    var presenter: DetailPresenterProtocol? { get set }
    var posts: [PostModel]? { get set }
    func configureView()
    
    // Presenter -> ViewController
    
    func showAlertView(with text: String)
    
}
