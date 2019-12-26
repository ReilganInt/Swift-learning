//
//  Manager.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit


enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/Dishes.json?alt=media&token=77cbc956-e7f6-490e-aef5-6dc18b9ee251"
    
    // TODO: Константы для точной передачи ошибки, добавить в последствии
    static let URLSessionErrorHasError = Notification.Name("URLSessionErrorHasError")
    static let URLSessionResponseHasError = Notification.Name("URLSessionResponseHasError")
    static let urlSessionDataHasError = Notification.Name("URLSessionDataHasError")
}

enum NotificationConstants {
    static let dataLoaded = Notification.Name("dataLoaded")
    static let URLSessinHasError = Notification.Name("URLSessinHasError")
}

enum ManagerNotificationType: String {
    case error = "urlSessinHasError"
    case loaded = "dataLoaded"
}

class Manager {
    
    //MARK: Prorepties
       
    private var dishes: [Dish]? {
        didSet {
            postNotification(type: .loaded)
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
                self.postNotification(type: .error)
                
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (100...299).contains(httpResponse.statusCode) else {
                    // Alert
                    self.postNotification(type: .error)
                    return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                let data = data,
                var model = try? JSONDecoder().decode(DishesModel.self, from: data) else {
                    // Alert
                    self.postNotification(type: .error)
                    return
            }
            
            model.dishes.sort { $0.name < $1.name }
            
            self.dishes = model.dishes
            
        }
        
        task.resume()
    }
    
    
    //MARK: Private Methods
    private func postNotification(type: ManagerNotificationType) {
        DispatchQueue.main.async {
            let notificationName = Notification.Name(type.rawValue)
            NotificationCenter.default.post(name: notificationName, object: nil)
        }
    }
    
}
