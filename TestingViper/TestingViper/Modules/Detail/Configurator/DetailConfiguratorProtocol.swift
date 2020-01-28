//
//  DetailConfiguratorProtocol.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

protocol DetailConfiguratorProtocol: class {
    
    // Presenter -> Configurator
    static func createDetailModule() -> UIViewController
}
