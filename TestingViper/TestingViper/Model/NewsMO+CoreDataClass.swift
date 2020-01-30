//
//  NewsMO+CoreDataClass.swift
//  TestingViper
//
//  Created by admin on 30.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData


public class NewsMO: NSManagedObject {

}

extension NewsMO: ManagedObjectProtocol {
    func toEntity() -> PostModel? {
        return PostModel(title: title, imageURLString: imageURLString, text: text)
    }
}
