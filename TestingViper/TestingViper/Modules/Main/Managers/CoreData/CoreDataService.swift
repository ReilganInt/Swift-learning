//
//  CoreDataService.swift
//  TestingViper
//
//  Created by admin on 30.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {
    
    // MARK: - Properties
    
    static let shared = CoreDataService()
    
    // MARK: - CoreDataServiceProtocol methods
    
    var errorHandler: (Error) -> Void = {_ in
        // Replace this implementation
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Post")
        container.loadPersistentStores(completionHandler: { [weak self](storeDescription, error) in
            if let error = error {
                NSLog("CoreData error \(error), \(String(describing: error._userInfo))")
                self?.errorHandler(error)
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        let context:NSManagedObjectContext = self.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()
    
    func performForegroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.viewContext.perform {
            block(self.viewContext)
        }
    }
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.persistentContainer.performBackgroundTask(block)
    }
}
