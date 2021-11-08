//
//  StartPage.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct StartPage: View {
    @State private var isShowingSessions = false
    let maxHeight: CGFloat
    let startSession: () -> Void
    
    @State private var examples = MoltSession.examples
    
    var body: some View {
        VStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            
            //change destination when DashboardView is completed
            Button("Begin",action: {
                startSession()
            }).buttonStyle(DashedButtonStyle())
                .padding()
            
            Spacer()
        }
        .overlay(
            BottomSheetView(isOpen: $isShowingSessions, closedOffset: 200, openOffset: 0) {
                ZStack {
                    Color.black
                    
                    DashboardListView(sessions: examples)
//                    SessionListView()
                }
            }
        )
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage(maxHeight: 100) {
            // start session
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
