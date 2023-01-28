//
//  CoreDataProvider.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/27/23.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    var persistentContainer: NSPersistentContainer
    static let shared = CoreDataProvider()
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ReminderModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to initialize ReminderModel \(error)")
            }
        }
    }
    
}
