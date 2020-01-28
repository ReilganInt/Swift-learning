//
//  MainConfiguratorProtocol.swift
//  TestingViper
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

protocol MainConfiguratorProtocol: class {
    
    // Presenter -> Configurator
    static func createMainModule() -> UIViewController
}
