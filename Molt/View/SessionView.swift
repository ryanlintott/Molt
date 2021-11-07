//
//  SessionView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

enum SessionState {
    case setup, stress, relax, journal, complete
}

struct SessionView: View {
    @Binding var sessionState: SessionState
    @State private var image = Image("foliage-bkgr")
    @State private var stressLevel: Int = 10
    @State private var goalLength: Int = 120
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                switch sessionState {
                case .setup:
                    SessionParameterView(goalLength: $goalLength, stressLevel: $stressLevel) {
                        sessionState = .stress
                    }
                case .stress:
                    StickyWall(stickies: .rainbow(count: stressLevel), frame: proxy.size)
                case .relax:
                    SessionTimerView(totalTime: goalLength)
                case .journal:
                    // replace with JournalView
                    EmptyView()
                case .complete:
                    // nothing
                    EmptyView()
                }
            }
            .background(
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                    
                    Color.clear
                        .background(.thickMaterial)
                }
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var sessionState = SessionState.setup
        
        var body: some View {
            SessionView(sessionState: $sessionState)
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
