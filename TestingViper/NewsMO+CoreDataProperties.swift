//
//  NewsMO+CoreDataProperties.swift
//  TestingViper
//
//  Created by admin on 31.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData


extension NewsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsMO> {
        return NSFetchRequest<NewsMO>(entityName: "NewsMO")
    }

    @NSManaged public var identifier: Int64
    @NSManaged public var imageURLString: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}
