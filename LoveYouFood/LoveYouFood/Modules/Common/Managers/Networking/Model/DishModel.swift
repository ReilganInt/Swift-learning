//
//  DishModel.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

struct DishesModel: DishesModelProtocol, Decodable {
    var dishes: [DishModel]?
    
    enum DishesCodingKeys: String, CodingKey {
        case dishes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DishesCodingKeys.self)
        self.dishes = try container.decode([DishModel].self, forKey: .dishes)
    }

}

struct DishModel: DishModelProtocol, Decodable {
    
    let name: String?
    let description: String?
    let image: String?
    let recipe: [RecipeModel]?
    
    enum DishCodingKeys: String, CodingKey {
        case name
        case description
        case image
        case recipe
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DishCodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.image = try container.decode(String.self, forKey: .image)
        self.recipe = try container.decode([RecipeModel].self, forKey: .recipe)
    }
    
    init(name: String?, description: String?, imageName: String?, ingredients: [RecipeModel]?) {
        self.name = name
        self.description = description
        self.image = imageName
        self.recipe = ingredients
    }
}

struct RecipeModel: RecipeModelProtocol, Decodable {
    var name : String?
    var weight : Double?

    enum RecipeCodingKeys: String, CodingKey {
        case name
        case weight
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RecipeCodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.weight = try container.decode(Double.self, forKey: .weight)
    }
}

extension DishModel: Equatable {
    static func == (lhs: DishModel, rhs: DishModel) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.image == rhs.image
    }
}
