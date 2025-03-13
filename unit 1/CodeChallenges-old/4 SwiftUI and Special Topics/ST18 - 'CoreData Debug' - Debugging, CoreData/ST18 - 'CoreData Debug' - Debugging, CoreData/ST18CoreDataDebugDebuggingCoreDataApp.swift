//
//  ST18CoreDataDebugDebuggingCoreDataApp.swift
//  ST18 - 'CoreData Debug' - Debugging, CoreData
//
//  Created by Jane Madsen on 6/7/24.
//

import SwiftUI

@main
struct ST18CoreDataDebugDebuggingCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
