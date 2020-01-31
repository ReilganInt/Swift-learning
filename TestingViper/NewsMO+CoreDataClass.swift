//
//  NewsMO+CoreDataClass.swift
//  TestingViper
//
//  Created by admin on 31.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//

import Foundation
import CoreData

@objc(NewsMO)
public class NewsMO: NSManagedObject {

}

extension NewsMO: ManagedObjectProtocol {
    func toEntity() -> PostModel? {
        PostModel(title: title, imageURLString: imageURLString, text: text)
    }
    
}
