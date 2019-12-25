//
//  Manager.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/Dishes.json?alt=media&token=f0c54eb1-d8fa-47fd-9a3d-93571fba7a2f"
    static let URLSessionErrorHasError = Notification.Name("URLSessionErrorHasError")
    static let URLSessionResponseHasError = Notification.Name("URLSessionResponseHasError")
    static let URLSessionDataHasError = Notification.Name("URLSessionDataHasError")
}

enum NotificationConstants {
    static let dishesDidLoad = Notification.Name("DishesDidLoad")
    static let URLSessinHasError = Notification.Name("URLSessinHasError")
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
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard error == nil else {
                // Alert
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: NotificationConstants.URLSessinHasError, object: nil)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (100...299).contains(httpResponse.statusCode) else {
                // Alert
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: NotificationConstants.URLSessinHasError, object: nil)

                }
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                let data = data,
                let model = try? JSONDecoder().decode(DishesModel.self, from: data) else {
                    // Alert
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NotificationConstants.URLSessinHasError, object: nil)
                    }
                    return
            }
            
            let old = model.dishes
            let new = old.sorted(by: self.sortAlphabet)
            self.dishes = new

        }
        
        task.resume()
    }
    
    
    func sortAlphabet(_ d1: Dish, _ d2: Dish) -> Bool {
        return d1.name < d2.name
    }
    
    //MARK: Private Methods
    
    private func postNotification() {
        NotificationCenter.default.post(name: NotificationConstants.dishesDidLoad, object: nil)
    }
    
}
