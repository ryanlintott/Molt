//
//  SessionListView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-08.
//

import SwiftUI

struct SessionListView: View {
    @Environment(\.managedObjectContext) private var moc

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \MoltSessionData.dateStarted, ascending: false)]) private var sessionsData: FetchedResults<MoltSessionData>
    
    var sessions: [MoltSession] {
        sessionsData.compactMap { $0.session }
    }
    
    var body: some View {
        VStack {
            Text("Sessions")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
            
            DashboardListView(sessions: sessions)
        }
    }
}

struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        SessionListView()
            .environment(\.managedObjectContext, PersistenceCloudController.preview.moc)
    }
}
