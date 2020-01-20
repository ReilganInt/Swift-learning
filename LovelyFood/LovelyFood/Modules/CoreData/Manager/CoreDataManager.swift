//
//  CoreDataManager.swift
//  LovelyFood
//
//  Created by admin on 18.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    private var dishes: [Dish] = []
    
    func fetchData() -> [Dish] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dish")

        do {
            dishes = try (managedContext.fetch(fetchRequest) as? [Dish] ?? [])
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    func save(name: String, description: String, image: UIImage) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let dish = Dish(context: managedContext)
        
        dish.name = name
        dish.desc = description
        dish.image = image
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func delete(at index: Int) {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
           
           let managedContext = appDelegate.persistentContainer.viewContext
           
           let item = dishes[index]
           
           managedContext.delete(item)
       }
    
}
