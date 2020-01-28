//
//  DishModelProtocols.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

protocol DishesModelProtocol {
    var dishes: [DishModel]? { get }
}

protocol DishModelProtocol {
    var name: String? { get }
    var description: String? { get }
    var image: String? { get }
    var recipe: [RecipeModel]? { get }
}

protocol RecipeModelProtocol {
    var name: String? { get }
    var weight: Double? { get }
}

