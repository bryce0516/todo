//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by 박혜성(Hyesung Park) on 12/14/23.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
