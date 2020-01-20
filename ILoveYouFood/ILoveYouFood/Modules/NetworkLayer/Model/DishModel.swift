//
//  DishModel.swift
//  ILoveYouFood
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

struct DishesModel: Codable {

    //MARK: Properties

    var dishes : [DishModel]

    //MARK: Coding Keys

    enum CodingKeys: String, CodingKey {
        case dishes
    }

    //MARK: Initializations

    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.dishes = try! container.decode([DishModel].self, forKey: .dishes)
    }

}

struct DishModel : Codable {

    //MARK:  Properties

    var name: String
    var description: String
    var image: String
    var date: String

    var recipe: [RecipeModel]

    //MARK: Coding Keys

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case image
        case date
        case recipe
    }

    //MARK: Initializations

    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.name = try! container.decode(String.self, forKey: .name)
        self.description = try! container.decode(String.self, forKey: .description)
        self.image = try! container.decode(String.self, forKey: .image)
        self.recipe = try! container.decode([RecipeModel].self, forKey: .recipe)
        self.date = try! container.decode(String.self, forKey: .date)
    }
}

struct RecipeModel : Codable {

    //MARK:  Properties

    var name : String
    var weight : Double

    //MARK: Coding Keys

    enum CodingKeys: String, CodingKey {
        case name
        case weight
    }

    //MARK: Initializations

    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.name = try! container.decode(String.self, forKey: .name)
        self.weight = try! container.decode(Double.self, forKey: .weight)
    }

}
