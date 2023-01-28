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
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                List(myListResults) { myList in
                    Text(myList.name ?? "")
                }
            }
            .padding()
            .navigationTitle("My Lists")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            
                            do {
                                let myList = MyList(context: viewContext)
                                myList.name = name
                                try myList.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                        }.disabled(!isFormValid)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
    }
}
