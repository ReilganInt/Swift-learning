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
    func download(isLoaded: @escaping (Result<[Dish], Error>) -> ())
    func getCount() -> Int
    func getItem(at index: Int) -> Dish
    func remove(at index: Int)
}

class MainManager: MainManagerProtocol {
    
    // MARK: - Propreties
    
    private var networkManager: NetworkManager
    private var coreDataManager: CoreDataManager
        
    // MARK: - Initialization
    
    init() {
        networkManager = NetworkManager()
        coreDataManager = CoreDataManager()
    }
    
    // MARK: - Public methods
    
    func download(isLoaded: @escaping (Result<[Dish], Error>) -> ()) {
            networkManager.request(completion: { [weak self] result in
            switch result {
            case .failure(let error):
                self?.coreDataManager.fetch()
                isLoaded(.failure(error))
            case .success(let data):
                self?.coreDataManager.save(forData: data)
                isLoaded(.success([]))
            }
        })
    }
    
    func getCount() -> Int {
        let count =  coreDataManager.getCount()
        return count
    }
    
    func getItem(at index: Int) -> Dish {
        return coreDataManager.getItem(at: index)
    }
    
    func remove(at index: Int) {
        coreDataManager.remove(at: index)
    }
}








