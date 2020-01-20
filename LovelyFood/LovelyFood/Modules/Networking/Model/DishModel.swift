//
//  DishModel.swift
//  LovelyFood
//
//  Created by admin on 17.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

struct DishesModel {
    var dishes : [DishModel]
}

extension DishesModel: Decodable {
    
    enum DishesCodingKeys: String, CodingKey {
        case dishes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DishesCodingKeys.self)
        self.dishes = try container.decode([DishModel].self, forKey: .dishes)
    }

}

struct DishModel {
    var name: String
    var description: String
    var image: String
    var recipe: [RecipeModel]
}

extension DishModel: Decodable {
    
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
}

struct RecipeModel {
    var name : String
    var weight : Double
}

extension RecipeModel: Decodable {
    
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

