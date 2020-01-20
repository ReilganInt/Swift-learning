//
//  NetworkServiceManager.swift
//  ILoveYouFood
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Alamofire

enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/new.json?alt=media&token=75c47e63-2756-4f6f-b982-1f98072cd5ac"
}

enum ManagerNotificationType: String {
    case error = "URLSessinHasError"
    case loaded = "dataLoaded"
}

class NetworkServiceManager {
    
    // MARK: - Properties
    
    private var dishes: [DishModel]?
    private var coreDataManger = CoreDataManager.shared
    
    // MARK: - Initialization
    
    
    // MARK: - Public Methods
    
    func getDishesCount() -> Int? {
           return dishes?.count
    }
    
    func getDishes() -> [DishModel]? {
        return dishes
    }
    
    func getItem(for index: Int) -> DishModel? {

        let count = getDishesCount() ?? 0
        
        if count == 0 {
            return nil
        }

        if count >= index {
            return dishes?[index]
        } else {
            return nil
        }
    }
    
    func loadData(dataIsLoaded: @escaping  (Bool) -> Void) {
        guard let url = URL(string: ManagerConstants.loadURlString) else { return }
        
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [weak self] response in

            switch response.result {
                case .success(let value):
                    var model = try? JSONDecoder().decode(DishesModel.self, from: value)
                    model?.dishes.sort { $0.name < $1.name }
                    self?.dishes = model?.dishes
                    self?.makeUniqDishes()
                    dataIsLoaded(true)
                // save in db
                case .failure( _):
                    // fetchFrom db
                    dataIsLoaded(false)
//                    self.postNotification(type: .error)
            }
        }
    }

    private func makeUniqDishes() {
        
        var dishDict = [String: DishManagedObject]()
        
        let dishesManagedObjects = coreDataManger.getDishes()
        
        for dish in dishesManagedObjects {
            dishDict[dish.name ?? "trash"] = dish
            for model in dishes ?? [] {
                let dateForm = DateFormatter()
                dateForm.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
                let modelDate = dateForm.date(from: model.date)
                if dish.name == model.name && dish.date! < modelDate ?? dish.date! {
                    let newModel = DishManagedObject()
                    newModel.name = model.name
                    newModel.descript = model.description
                    newModel.date = modelDate
                    dishDict[dish.name ?? "trash"] = newModel
                }
            }
        }
        
    }
    
    //MARK: - Private Methods
       private func postNotification(type: ManagerNotificationType) {
           DispatchQueue.main.async {
               let notificationName = Notification.Name(type.rawValue)
               NotificationCenter.default.post(name: notificationName, object: nil)
           }
       }
    
    
}
