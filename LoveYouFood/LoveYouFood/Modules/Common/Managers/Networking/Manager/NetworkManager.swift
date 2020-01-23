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

class NetworkManager : NetworkManagerProtocol {
    
    func request(completion: @escaping (Result<[DishModelProtocol], Error>) -> ()) {
        AF.request(Router.basePath).validate().responseData(completionHandler: { response in
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

/*
 enum NetworkResponse : String {
 case authentificationError = "You need to be authentificated first or Your API Key is invalid."
 case badRequest = "Bad request."
 case outdated = "The url you requested is outdated."
 case failed = "Network request failed"
 case noData = "Response returne with no data to decode."
 case unableToDecode = "We could not decode the response."
 case unableToReadStatuCode = "We could not read status code from response"
 }
 
 fileprivate func handleNetworkResponse(_ response: AFDataResponse<Data>) -> String {
 
 guard let statusCode = response.response?.statusCode else {
 return NetworkResponse.unableToReadStatuCode.rawValue
 }
 
 switch statusCode {
 case 401...500: return NetworkResponse.authentificationError.rawValue
 case 501...599: return NetworkResponse.badRequest.rawValue
 case 600: return NetworkResponse.outdated.rawValue
 default: return NetworkResponse.failed.rawValue
 }
 }
 
 */

