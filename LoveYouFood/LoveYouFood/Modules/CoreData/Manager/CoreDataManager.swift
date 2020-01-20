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
    func save(forData data: [DishModelProtocol]?)
    func saveContext()
    func remove(at index: Int)
    func getCount() -> Int
    func getItem(at index: Int) -> Dish
}

class CoreDataManager: DataBaseProtocol {
    
    private var context: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        return managedContext
    }
    
    private var dishManagedObjects: [Dish]? {
        didSet {
            saveContext()
        }
    }
    
    func fetch() {
        dishManagedObjects = []
        guard let context = context else { return }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dish")
        
        do {
            dishManagedObjects = try (context.fetch(fetchRequest) as? [Dish] ?? [])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func save(forData data: [DishModelProtocol]?) {
        guard let context = context, let lodedData = data else { return }
        for value in lodedData {
            let dish = Dish(context: context)
            dish.name = value.name
            dish.desc = value.description
            dish.image = value.image
            dishManagedObjects?.append(dish)
        }
    }

    func saveContext() {
        do {
            try context?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func remove(at index: Int) {
        guard let item = dishManagedObjects?[index] else { return }
        context?.delete(item)
        dishManagedObjects?.remove(at: index)
    }
    
    func getCount() -> Int {
        return dishManagedObjects?.count ?? 0
    }
    
    func getItem(at index: Int) -> Dish {
        return (dishManagedObjects?[index])!
    }
}
