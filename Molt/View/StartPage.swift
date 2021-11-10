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
            Image("moltLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
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
                    
                    SessionListView()
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
        .environment(\.managedObjectContext, PersistenceCloudController.preview.container.viewContext)
    }
}
