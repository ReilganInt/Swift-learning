//
//  RoutesProtocol.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Alamofire

protocol URLRouter {
    static var basePath: String { get }
}

protocol Routable {
    typealias Parameters = [String : Any]
    var route: String {get set}
    init()
}

extension Routable {
    init () {
        self.init()
    }
}

protocol Readable: Routable {}

extension Readable where Self: Routable {

    static func get(params: String) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .get, route: route)
    }
}

protocol Creatable: Routable {}

extension Creatable where Self: Routable {

    static func create(parameters: Parameters) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)"
        return RequestConverter(method: .post, route: route)
    }
}

protocol Updatable: Routable {}

extension Updatable where Self: Routable {

    static func update(params: String, parameters: Parameters) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .put, route: route, parameters: parameters)
    }
}

protocol Deletable: Routable {}

extension Deletable where Self: Routable {

    static func delete(params: String) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .delete, route: route)
    }
}
