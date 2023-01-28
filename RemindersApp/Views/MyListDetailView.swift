//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    init(myList: MyList) {
        self.myList = myList
        _reminderResults = FetchRequest(fetchRequest: Reminder.byList(myList: myList))
    }
    
    var body: some View {
        VStack {
            ReminderListView(reminders: reminderResults)
        }.navigationTitle(myList.name ?? "")
    }
}

struct MyListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyListDetailView(myList: PreviewData.myList)
        }
    }
}
