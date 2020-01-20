//
//  IngridientManagedObject+CoreDataProperties.swift
//  ILoveYouFood
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData


extension IngridientManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngridientManagedObject> {
        return NSFetchRequest<IngridientManagedObject>(entityName: "IngridientManagedObject")
    }

    @NSManaged public var name: String?
    @NSManaged public var weight: Float
    @NSManaged public var dish: DishManagedObject?

}
