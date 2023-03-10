//
//  ReminderDetailView.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import SwiftUI

struct ReminderDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let reminder: Reminder
    
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            TextField("", text: $title)
            Button("Update") {
                reminder.title = title
                try? reminder.save()
                dismiss() 
            }
            
            Button("Delete") {
                do {
                    try reminder.delete()
                    dismiss() 
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.onAppear {
            title = reminder.title ?? ""
        }
    }
}

struct ReminderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderDetailView(reminder: PreviewData.reminder)
    }
}
