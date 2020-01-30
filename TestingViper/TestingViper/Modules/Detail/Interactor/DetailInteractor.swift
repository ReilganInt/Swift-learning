//
//  DetailInteractor.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    
    // MARK: - Properties
    
    var presenter: DetailInteractorOutputProtocol?
    
    // MARK: - DetailInteractorInputProtocol methods
    
    
}

extension DetailInteractor: DetailInteractorOutputProtocol {
    
    // MARK: - DetailInteractorOutputProtocol methods
    
    func onError(with text: String) {
        
    }
    
}
