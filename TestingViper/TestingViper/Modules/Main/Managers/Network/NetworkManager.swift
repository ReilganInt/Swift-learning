//
//  NetworkManager.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerInputProtocol {
    
    // MARK: - Properties
    
    var networkRequestHandler: NetworkManagerOutputProtocol?
    
    // MARK: - NetworkManagerInputProtocol methods
    
    func retrievePostList(for type: Endpoints.Posts) {
        AF.request(type.url)
            .validate()
            .responseData(completionHandler: { [weak self] response in
                switch response.result {
                case .success(let value):
                    do {
                        let model = try JSONDecoder().decode(PostsModel.self, from: value)
                        self?.networkRequestHandler?.onPostsRetrieved(model.posts, for: type)
                    } catch let error as NSError {
                        self?.networkRequestHandler?.onError(with: "Invalid JSON. Error: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self?.networkRequestHandler?.onError(with: error.errorDescription ?? "Alamofire error")
                }
            })
    }
    
    
}
