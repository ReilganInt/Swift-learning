//
//  recipeClass.swift
//  RecipeManager
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class Recipe {
    
    //MARK: Properties
    
    var name: String
    var description: String
    var image: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, description: String, image: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The description must not be empty
        guard !description.isEmpty else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.description = description
        self.image = image
    }
}
