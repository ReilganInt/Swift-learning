//
//  DishMO+CoreDataProperties.swift
//  TestingViper
//
//  Created by admin on 30.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData


extension DishMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DishMO> {
        return NSFetchRequest<DishMO>(entityName: "DishMO")
    }

    @NSManaged public var imageURLString: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var identifier: Int
}
