//
//  CoreDataManagerProtocol.swift
//  TestingViper
//
//  Created by admin on 30.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataManagerError: Error{
    case cannotFetch(String)
    case cannotSave(Error)
}

protocol CoreDataManagerProtocol {
    associatedtype EntityType
    func get(with predicate: NSPredicate?,
             sortDescriptors: [NSSortDescriptor]?,
             fetchLimit: Int?,
             completion: @escaping (Result<[EntityType], Error>) -> Void)
    func save(entities: [EntityType], with type: Endpoints.Posts, completion: @escaping (Error?) -> Void)
}

extension CoreDataManagerProtocol {
    func get(with predicate: NSPredicate? = nil,
             sortDescriptors: [NSSortDescriptor]? = nil,
             fetchLimit: Int? = nil,
             completion: @escaping (Result<[EntityType], Error>) -> Void){
        get(with: predicate,
            sortDescriptors: sortDescriptors,
            fetchLimit: fetchLimit,
            completion: completion)
    }
    
}
