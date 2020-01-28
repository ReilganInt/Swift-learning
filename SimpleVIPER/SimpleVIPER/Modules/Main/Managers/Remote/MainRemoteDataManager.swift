//
//  MainRemoteDataManager.swift
//  SimpleVIPER
//
//  Created by admin on 27.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

class MainRemoteDataManager: MainRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol?
    
    func retrievePostList(with type: EndPoint) {
        AF.request(type.url, method: .get)
            .validate()
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let posts):
                    do {
                        let model = try JSONDecoder().decode(PostsModel.self, from: posts)
                        self.remoteRequestHandler?.onPostsRetrieved(model.posts)
                    } catch _ as NSError {
                        self.remoteRequestHandler?.onError()
                    }
                case .failure(_):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
    
}
