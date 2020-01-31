//
//  CoreDataManger.swift
//  TestingViper
//
//  Created by admin on 30.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager<ManagedEntity, Entity>: CoreDataManagerProtocol where
    ManagedEntity: NSManagedObject,
    ManagedEntity: ManagedObjectProtocol,
    Entity: ManagedObjectConvertible {

    typealias EntityType = Entity
    
    let coreData: CoreDataServiceProtocol
    
    init(coreData: CoreDataServiceProtocol = CoreDataService.shared) {
        self.coreData = coreData
    }
    func get(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, fetchLimit: Int?,
             completion: @escaping (Result<[Entity], Error>) -> Void) {
        
        do {
            let context = coreData.viewContext
            let fetchRequest = ManagedEntity.fetchRequest()
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sortDescriptors
            if let fetchLimit = fetchLimit {
                fetchRequest.fetchLimit = fetchLimit
            }
            let results = try context.fetch(fetchRequest) as? [ManagedEntity]
            let items: [Entity] = results?.compactMap { $0.toEntity() as? Entity } ?? []
            completion(.success(items))
        } catch {
            let fetchError = CoreDataManagerError.cannotFetch("Cannot fetch error: \(error))")
            completion(.failure(fetchError))
        }

    }
    
    func save(entities: [Entity], with type: Endpoints.Posts, completion: @escaping (Error?) -> Void) {
        for entity in entities {
            _ = entity.toManagedObject(in: coreData.viewContext, with: type)
        }
        coreData.saveContext()
    }
    
    
}
