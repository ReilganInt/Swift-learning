//
//  DetailRouter.swift
//  TestingViper
//
//  Created by admin on 29.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    
    // MARK: - DetailRouterProtocol methods
    
    func pop(from view: DetailViewProtocol) {
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.popViewController(animated: true)
        }
    }

}
