//
//  StartPage.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct StartPage: View {
    @State private var showSessions = false
    let maxHeight: CGFloat
    let startSession: () -> Void
    
    var body: some View {
        VStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            
            Spacer()
            
            //change destination when DashboardView is completed
            Button("Begin",action: {
                startSession()
            }).buttonStyle(DashedButtonStyle())
                .padding()
            
            BottomSheetView(
                isOpen: $showSessions,
                maxHeight: UIScreen.main.bounds.height * 0.7
            ) {
                ZStack {
                    Color.black
                    VStack {
                        Text("**Sessions**")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage(maxHeight: 100) {
            // start session
        }
    }
}
