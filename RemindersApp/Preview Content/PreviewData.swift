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
    
}

