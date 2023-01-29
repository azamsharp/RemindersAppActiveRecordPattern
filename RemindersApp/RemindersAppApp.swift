//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Mohammad Azam on 1/27/23.
//

import SwiftUI

@main
struct RemindersAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
