//
//  CoreDataManager.swift
//  LoveYouFood
//
//  Created by admin on 20.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol DataBaseProtocol: AnyObject {
    func fetch()
    func fillData(forData data: [DishModelProtocol])
    func remove(by model: DishModel)
}

final class CoreDataManager: DataBaseProtocol {
    
    // MARK: - Protoperties
    
    private let modelName: String
    private var managedObjectModelArray: [Dish] = []
    
    // MARK: - Initialization
    
    init(modelName: String) {
        self.modelName = modelName

        // Setup Notification Handling
        setupNotificationHandling()
    }
    
    private lazy var privateManagedObjectContext: NSManagedObjectContext = {
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }

        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }
        
        return managedObjectModel
    }()
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        managedObjectContext.parent = self.privateManagedObjectContext

        return managedObjectContext
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)

        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"

        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)

        do {
            let options = [ NSInferMappingModelAutomaticallyOption : true,
                            NSMigratePersistentStoresAutomaticallyOption : true]

            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                              configurationName: nil,
                                                              at: persistentStoreURL,
                                                              options: options)
        } catch {
            fatalError("Unable to Load Persistent Store")
        }
        
        return persistentStoreCoordinator
    }()
    
    // MARK: - Helper Methods

    private func setupNotificationHandling() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(CoreDataManager.saveChanges(_:)), name: UIApplication.willTerminateNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(CoreDataManager.saveChanges(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    // MARK: - Notification Handling

    @objc func saveChanges(_ notification: NSNotification) {
        managedObjectContext.perform {
            do {
                if self.managedObjectContext.hasChanges {
                    try self.managedObjectContext.save()
                }
            } catch {
                let saveError = error as NSError
                print("Unable to Save Changes of Managed Object Context")
                print("\(saveError), \(saveError.localizedDescription)")
            }

            self.privateManagedObjectContext.perform {
                do {
                    if self.privateManagedObjectContext.hasChanges {
                        try self.privateManagedObjectContext.save()
                    }
                } catch {
                    let saveError = error as NSError
                    print("Unable to Save Changes of Private Managed Object Context")
                    print("\(saveError), \(saveError.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Public Methods
    
    func fetch() {
        managedObjectModelArray = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dish")
        
        do {
            managedObjectModelArray = try (managedObjectContext.fetch(fetchRequest) as? [Dish] ?? [])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func fillData(forData data: [DishModelProtocol]) {
        let lodedData = data
        fetch()
        for value in lodedData {
            let dish = Dish(context: managedObjectContext)
            dish.name = value.name
            dish.desc = value.description
            dish.image = value.image
            managedObjectModelArray.append(dish)
        }
    }
    
    // Equatable
    func remove(by model: DishModel) {
        fetch()
        for item in managedObjectModelArray {
            let dishModel = createModel(from: item)
            if model == dishModel {
                managedObjectContext.delete(item)
                break
            }
        }
    }
    
    func removeAll() {
        fetch()
        for item in managedObjectModelArray {
            managedObjectContext.delete(item)
        }
    }
    
    
    private func createModel(from object: Dish) -> DishModel {
        let model = DishModel(name: object.name,
                              description: object.desc,
                              imageName: object.image,
                              ingredients: nil)
        return model
    }
    
}
