//
//  MainManager.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import CoreData

protocol MainManagerProtocol {
    func download(isLoaded: @escaping (Result<Void, Error>) -> ())
    func getCount() -> Int
    func getItem(at index: Int) -> DishModelProtocol
    func remove(at index: Int)
}

final class MainManager: MainManagerProtocol {
    
    // MARK: - Propreties
    
    var actualItems: [DishModelProtocol] = []
    
    fileprivate var networkManager = NetworkManager()
    fileprivate var coreDataManager = CoreDataManager(modelName: "LoveYouFood")
    
    // MARK: - Public methods
    
    func download(isLoaded: @escaping (Result<Void, Error>) -> ()) {
        networkManager.request(completion: { [weak self] result in
            switch result {
            case .failure(let error):
                self?.coreDataManager.fetch()
                isLoaded(.failure(error))
                // переход на fetch в другом потоке
                // почитать про потокобезопасность core data & сделать правильно (fetch/save)
            case .success(let data):
                // переход на сохранение в другом потоке
                // почитать про потокобезопасность core data & сделать правильно (fetch/save)
                self?.coreDataManager.fillData(forData: data)
                self?.actualItems = data
                isLoaded(.success(Void()))
            }
        })
        
        
    }
    
    func getCount() -> Int {
        let count = actualItems.count
        return count
    }
    
    func getItem(at index: Int) -> DishModelProtocol {
        return actualItems[index]
    }
    
    func remove(at index: Int) {
        guard let model = actualItems[index] as? DishModel else { return }
        coreDataManager.remove(by: model)
        actualItems.remove(at: index)
    }
    
    func ggwp() {
        coreDataManager.removeAll()
    }
}








