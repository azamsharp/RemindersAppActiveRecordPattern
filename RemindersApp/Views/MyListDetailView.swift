//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/28/23.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    @State private var isPresented: Bool = false
    @State private var title: String = ""
    
    
    init(myList: MyList) {
        self.myList = myList
        _reminderResults = FetchRequest(fetchRequest: Reminder.byList(myList: myList))
    }
    
    private var isFormValid: Bool {
        !title.isEmpty // add more rules
    }
    
    private func saveReminder() {
        let reminder = Reminder(context: viewContext)
        reminder.title = title
        reminder.list = myList
        do {
            try reminder.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            ReminderListView(reminders: reminderResults)
        }.navigationTitle(myList.name ?? "")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Reminder") {
                        isPresented = true
                    }
                }
            }.alert("New Reminder", isPresented: $isPresented) {
                TextField("Title", text: $title)
                Button("Cancel", role: .cancel, action: {})
                Button("Ok") {
                    if isFormValid {
                        saveReminder()
                    }
                }
            }
    }
}

struct MyListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyListDetailView(myList: PreviewData.myList)
                .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
