//
//  DataBaseManager.swift
//  TestingViper
//
//  Created by admin on 28.01.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import CoreData

class DataBaseManager: DataBaseManagerInputProtocol {
    
    // MARK: - DataBaseManagerInputProtocol methods
    
    func retrievePostList(for type: Endpoints.Posts) throws -> [Post] {
        
        guard let managedOC = DataBaseStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        
        return try managedOC.fetch(request)
    }
    
    func savePost(title: String, imageURLString: String, text: String) throws {
        
        guard let managedOC = DataBaseStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: "Post", in: managedOC) {
            let post = Post(entity: newPost, insertInto: managedOC)
            post.title = title
            post.imageURLString = imageURLString
            post.text = text
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject

    }
    
}

