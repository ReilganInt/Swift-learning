//
//  DishManagedObject+CoreDataProperties.swift
//  ILoveYouFood
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData


extension DishManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DishManagedObject> {
        return NSFetchRequest<DishManagedObject>(entityName: "DishManagedObject")
    }

    @NSManaged public var descript: String?
    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var date: Date?
    @NSManaged public var ingridients: NSSet?

}

// MARK: Generated accessors for ingridients
extension DishManagedObject {

    @objc(addIngridientsObject:)
    @NSManaged public func addToIngridients(_ value: IngridientManagedObject)

    @objc(removeIngridientsObject:)
    @NSManaged public func removeFromIngridients(_ value: IngridientManagedObject)

    @objc(addIngridients:)
    @NSManaged public func addToIngridients(_ values: NSSet)

    @objc(removeIngridients:)
    @NSManaged public func removeFromIngridients(_ values: NSSet)

}
