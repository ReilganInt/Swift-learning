//
//  RouterProtocol.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestConverterProtocol: URLRequestConvertible {
    var method: HTTPMethod {get set}
    var route: String {get set}
    var parameters: Parameters {get set}
}

struct RequestConverter: RequestConverterProtocol {

    var method: HTTPMethod
    var route: String
    var parameters: Parameters = [:]

    init(method: HTTPMethod, route: String, parameters: Parameters = [:]) {
        self.method = method
        self.route = route
        self.parameters = parameters
    }

    func asURLRequest() throws -> URLRequest {

        let url = try Router.basePath.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(route))

        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
