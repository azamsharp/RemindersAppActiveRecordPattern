//
//  ContentView.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: MyList.all)
    private var myListResults: FetchedResults<MyList>
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name: String = ""
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
    private func saveMyList() {
        // add a new list
        do {
            let myList = MyList(context: viewContext)
            myList.name = name
            try myList.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        if isFormValid {
                           saveMyList()
                        }
                    }
                List(myListResults) { myList in
                    NavigationLink {
                        MyListDetailView(myList: myList)
                    } label: {
                        Text(myList.name ?? "")
                    }
                }
            }
            .padding()
            .navigationTitle("My Lists")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add Reminder") {
                            
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
