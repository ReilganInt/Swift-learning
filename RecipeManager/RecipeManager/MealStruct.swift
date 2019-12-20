//
//  MealStruct.swift
//  RecipeManager
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

struct Meal : Codable {
    
    //MARK: Proeperties
    
    var name : String?
    var description : String?
    var image : String?
    
    var recipe : [Recipe]?
    
    //MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case image
        case recipe
    }

    //MARK: Initializations
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.description = try? container.decode(String.self, forKey: .description)
        self.image = try? container.decode(String.self, forKey: .image)
        self.recipe = try? container.decode([Recipe].self, forKey: .image)
    }
    
    
}
