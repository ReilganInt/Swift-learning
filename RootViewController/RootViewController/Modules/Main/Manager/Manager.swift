//
//  Manager.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/Dishes.json?alt=media&token=4f4a5628-bccd-4486-a251-840aada6584b"
}

enum NotificationConstants {
    static let dishesDidLoad = Notification.Name("DishesDidLoad")
}

class Manager {
    
    //MARK: Prorepties
    
    private var dishes: [Dish]? {
        didSet {
            postNotification()
        }
    }
    
    //MARK: Public Methods
    
    func getDishesCounr() -> Int {
        return dishes?.count ?? 0
    }
    
    func getRecipeCoun(for index: Int) -> Int {
        return dishes?[index].recipe.count ?? 0
    }
    
    func getItem(for index: Int) -> Dish? {
        
        let count = getDishesCounr()
        
        if count >= index {
            return dishes?[index]
        } else {
            return nil
        }
    }
    
    func loadData() {
        
        guard let url = URL(string: ManagerConstants.loadURlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                // Alert
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                // Alert
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                let data = data,
                let model = try? JSONDecoder().decode(DishesModel.self, from: data) else {
                    // Alert
                    return
            }
            
            self.dishes = model.dishes
        }
        
        task.resume()
    }
    
    //MARK: Private Methods
    
    private func postNotification() {
        NotificationCenter.default.post(name: NotificationConstants.dishesDidLoad, object: nil)
    }
}
