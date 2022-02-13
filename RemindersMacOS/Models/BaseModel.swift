//
//  BaseModel.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import Foundation
import CoreData

protocol BaseModel {
    
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
  
}

extension BaseModel where Self: NSManagedObject {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
    
    static func byId<T>(id: NSManagedObjectID) -> T? {
        viewContext.object(with:id) as? T
    }
    
}
