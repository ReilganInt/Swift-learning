//
//  DishesModel.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

struct DishesModel: Codable {

    //MARK: Properties

    var dishes : [Dish]

    //MARK: Coding Keys

    enum CodingKeys: String, CodingKey {
        case dishes
    }

    //MARK: Initializations

    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.dishes = try! container.decode([Dish].self, forKey: .dishes)
    }

}

struct Dish : Codable {

    //MARK:  Properties

    var name: String
    var description: String
    var image: String

    var recipe: [Recipe]

    //MARK: Coding Keys

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case image
        case recipe
    }

    //MARK: Initializations

    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.name = try! container.decode(String.self, forKey: .name)
        self.description = try! container.decode(String.self, forKey: .description)
        self.image = try! container.decode(String.self, forKey: .image)
        self.recipe = try! container.decode([Recipe].self, forKey: .recipe)
    }
}

struct Recipe : Codable {

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
