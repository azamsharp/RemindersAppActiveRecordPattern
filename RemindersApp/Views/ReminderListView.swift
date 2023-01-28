//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders: FetchedResults<Reminder>
    
    var body: some View {
        List(reminders) { reminder in
            Text(reminder.title ?? "")
        }
    }
}

struct ReminderListViewContainer_Previews: PreviewProvider {
    
    struct ReminderListViewContainer: View {
        
        @FetchRequest(sortDescriptors: [])
        private var reminderResults: FetchedResults<Reminder>
        
        var body: some View {
            // ReminderListView is the view I want to preview
            ReminderListView(reminders: reminderResults)
        }
    }
    
    static var previews: some View {
        ReminderListViewContainer()
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
