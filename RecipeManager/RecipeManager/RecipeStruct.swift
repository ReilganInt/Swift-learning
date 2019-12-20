//
//  RecipeStruct.swift
//  RecipeManager
//
//  Created by admin on 20/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

struct Recipe : Codable {
    
    //MARK: Properties
    
    var name : String?
    var weight : Float?
    
    //MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case name
        case weight
    }

    //MARK: Initializations
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.weight = try? container.decode(Float.self, forKey: .weight)
    }
    
}
