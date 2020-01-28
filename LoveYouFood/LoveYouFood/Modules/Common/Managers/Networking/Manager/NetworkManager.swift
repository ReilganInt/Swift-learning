//
//  NetworkManager.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func request(completion: @escaping (Result<[DishModelProtocol], Error>) -> ())
}

final class NetworkManager : NetworkManagerProtocol {
    
    func request(completion: @escaping (Result<[DishModelProtocol], Error>) -> ()) {
        
        // 1 - utility
       
        AF.request(Router.basePath).validate().responseData(queue: .global(qos: .utility), completionHandler: { response in
            
            
            switch response.result {
            case .success(let value):
                do {
                    let model = try JSONDecoder().decode(DishesModel.self, from: value)
                    completion(.success(model.dishes ?? []))
                } catch let error as NSError {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
