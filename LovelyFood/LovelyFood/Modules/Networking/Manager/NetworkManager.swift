//
//  NetworkManager.swift
//  LovelyFood
//
//  Created by admin on 17.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    func request(completion: @escaping ([DishModel]?, String?) -> ()) {
        AF.request(Router.basePath).validate().responseData(completionHandler: { response in
            switch response.result {
                case .success(let value):
                    var model = try? JSONDecoder().decode(DishesModel.self, from: value)
                    model?.dishes.sort { $0.name < $1.name }
                    completion(model?.dishes, nil)
                case .failure(_):
                    let error = handleNetworkResponse(response)
                    completion(nil, error)
            }
        })
    }
}

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

