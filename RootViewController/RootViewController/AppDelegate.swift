//
//  AppDelegate.swift
//  RootViewController
//
//  Created by admin on 24/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.save()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DishList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("PersistentContainer: \(error)")
            }
        })
        return container
    }()
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("func save: \(nsError)")
            }
        }
    }
}

