//
//  MainManager.swift
//  LovelyFood
//
//  Created by admin on 17.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import CoreData

protocol MainProtocol {
    
    var count: Int { get }
    
    
    func fetchData(dataIsLoaded: @escaping (Bool) -> ())
    func push()
    func remove()
}

class MainManager : MainProtocol {
    
    
    // Singleton
    
    static let shared = MainManager()
    private var networkManager: NetworkManager
    private var coreDataManger: CoreDataManager
    
    private init() {
        // init managers
        networkManager = NetworkManager()
        coreDataManger = CoreDataManager()
    }
    
    // MARK; - Private Properties
    
    
    
    private var coreDataDishes: [Dish]?

    // MARK: - Request data from FireBase
    
    func fetchData(dataIsLoaded: @escaping (Bool) -> ()) {
        networkManager.request(completion: { [weak self] dishes, error in
            if let error = error {
                self?.coreDataDishes = self?.coreDataManger.fetchData()
                dataIsLoaded(false)
                print(error)
            }
            if let dishes = dishes {
                for value in dishes {
                    let dish = Dish()
                    dish.name = value.name
                    dish.desc = value.description
                    dish.image = UIImage(named: value.image)
                    self?.coreDataDishes?.append(dish)
                }
                dataIsLoaded(true)
            }
        })
    }
    
    func getDishesCount() -> Int {
        return coreDataDishes?.count ?? 0
    }
    
    func getItem(for index: Int) -> Dish? {
        return coreDataDishes?[index] ?? nil
    }
    
    func deleteItem(for index: Int) {
        coreDataManger.delete(at: index)
        coreDataDishes?.remove(at: index)
    }
    
    func saveItem(for index: Int, name: String, description: String, image: UIImage) {
        let dish = Dish()
        dish.name = name
        dish.desc = description
        dish.image = image
        coreDataManger.save(name: name, description: description, image: image)
        coreDataDishes?.append(dish)
    }
}

