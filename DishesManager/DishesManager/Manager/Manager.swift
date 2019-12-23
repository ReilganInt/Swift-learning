//
//  Manager.swift
//  DishesManager
//
//  Created by admin on 23/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/Dishes.json?alt=media&token=4f4a5628-bccd-4486-a251-840aada6584b"
}

class Manager {
    
    //MARK: Properties
    
    private var dishes: [Dish]? {
        didSet {
            postNotification()
        }
    }
    
    //MARK: Public Methods
    
    func getDishesCount() -> Int {
        return dishes?.count ?? 0
    }
    
    func getRecipeCount(for index: Int) -> Int {
        return dishes?[index].recipe.count ?? 0
    }
    
    func getItem(for index: Int) -> Dish? {
        let count = getDishesCount()
        if count >= index {
            return dishes?[index]
        } else {
            return nil
        }
    }
    
    func loadData() {
        guard let url = URL(string: ManagerConstants.loadURlString) else { return }
        
        if let data = try? Data(contentsOf: url) {
            let model = try? JSONDecoder().decode(Dishes.self, from: data)
            dishes = model?.dishes
        } else {
            return
        }
    }
    
    //MARK: Private Methods
    
    private func postNotification() {
        NotificationCenter.default.post(name: NotificationConstants.dishesDidLoad , object: nil)
    }
}


