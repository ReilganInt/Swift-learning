//
//  RecipeDelegate.swift
//  RootViewController
//
//  Created by admin on 25/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeDelegate: class {
    func sentMessageToChangeColor(color: UIColor)
    func sentMessageToClose()
    func sentMessageToChangeTitle()
}
