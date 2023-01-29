//
//  ReminderListView2.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import SwiftUI

struct ReminderListView2: View {
    
    let reminders: [Reminder]
    
    var body: some View {
        List(reminders) { reminder in
            NavigationLink {
                ReminderDetailView(reminder: reminder)
            } label: {
                Text(reminder.title ?? "")
            }           
        }
    }
}

struct ReminderListView2_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListView2(reminders: [])
    }
}
