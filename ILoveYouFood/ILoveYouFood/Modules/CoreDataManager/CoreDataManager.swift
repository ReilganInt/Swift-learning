//
//  CoreDataManager.swift
//  ILoveYouFood
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import CoreData

public class CoreDataManager {
    
    // MARK: - Shared
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    // MARK: - Properties
    
    private var dishes: [DishManagedObject] = []
    
    // MARK: - Methods
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DishManagedObject")
        
        do {
            dishes = try (managedContext.fetch(fetchRequest) as? [DishManagedObject] ?? [])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func getDishes() -> [DishManagedObject] {
        return dishes
    }
    
    func getDishesCount() -> Int {
        return dishes.count
    }
    
    func getItem(for index: Int) -> DishManagedObject? {
        let count = getDishesCount()
        
        if count >= index {
            return(dishes[index])
        } else {
            return nil
        }
        
    }
    
    func save(name: String, description: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let dish = DishManagedObject(context: managedContext)
        
        dish.name = name
        dish.descript = description
        
        do {
            try managedContext.save()
            dishes.append(dish)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func delete(at index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let item = dishes[index]
        
        managedContext.delete(item)
        dishes.remove(at: index)
        
    }
}
