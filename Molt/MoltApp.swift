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
                .onAppear(perform: loadMarketingDataIfSimulator)
        }
    }
    
    func loadMarketingDataIfSimulator() {        
#if targetEnvironment(simulator)
        print("Loading Marketing Data")
        persistenceController.moc.deleteAllData("MoltSessionData")
        persistenceController.moc.performAndSave { context in
            MarketingSession.sampleData.forEach {
                let session = MoltSessionData(context: context)
                session.setValues(from: $0)
            }
        }
#endif
    }
}
