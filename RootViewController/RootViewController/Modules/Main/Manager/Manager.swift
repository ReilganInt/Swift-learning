//
//  Manager.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit
import Alamofire


enum ManagerConstants {
    static let loadURlString = "https://firebasestorage.googleapis.com/v0/b/recipes-64c49.appspot.com/o/new.json?alt=media&token=75c47e63-2756-4f6f-b982-1f98072cd5ac"
}

enum NotificationConstants {
    static let dataLoaded = Notification.Name("dataLoaded")
    static let URLSessinHasError = Notification.Name("URLSessinHasError")
}

enum ManagerNotificationType: String {
    case error = "URLSessinHasError"
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

        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in

            switch response.result {
                case .success(let value):
                    var model = try? JSONDecoder().decode(DishesModel.self, from: value)
                    model?.dishes.sort { $0.name < $1.name }
                    self.dishes = model?.dishes
                case .failure( _):
                    self.postNotification(type: .error)
            }
        }

    }


    //MARK: Private Methods
    private func postNotification(type: ManagerNotificationType) {
        DispatchQueue.main.async {
            let notificationName = Notification.Name(type.rawValue)
            NotificationCenter.default.post(name: notificationName, object: nil)
        }
    }

}
