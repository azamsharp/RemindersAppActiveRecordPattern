//
//  Reminder+Extensions.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import Foundation
import CoreData

extension Reminder: Model {
    
    static func byList(myList: MyList) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@", myList)
        return request 
    }
    
}
