//
//  PreviewData.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import Foundation

class PreviewData {
        
    static var myList: MyList {
        let myList = MyList(context: CoreDataProvider.shared.viewContext)
        myList.name = "Groceries"
        return myList
    }
    
    static var reminder: Reminder {
        let myList = MyList(context: CoreDataProvider.shared.viewContext)
        myList.name = "Groceries"
        let reminder = Reminder(context: CoreDataProvider.shared.viewContext)
        reminder.title = "Reminder 1"
        reminder.list = myList
        return reminder 
    }
    
}

