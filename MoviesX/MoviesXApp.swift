//
//  MoviesXApp.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import SwiftUI

@main
struct MoviesXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
