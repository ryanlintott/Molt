//
//  MainView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

struct MainView: View {
    @State private var isShowingSession = false
    @State private var sessionState: SessionState = .complete
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                if sessionState == .complete {
                    StartPage(maxHeight: proxy.size.height) {
                        sessionState = .setup
                    }
                } else {
                    SessionView(sessionState: $sessionState)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
