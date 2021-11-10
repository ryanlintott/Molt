//
//  MoltApp.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

@main
struct MoltApp: App {
    let persistenceController = PersistenceCloudController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.moc)
        }
    }
}
