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
    static let images = ["bg1","bg2","bg3","bg4","bg5","bg6","bg7","bg8","bg9","bg10","bg11","bg12","bg13","bg14"]
    
    @Binding var sessionState: SessionState
    @State private var image = Image(images.randomElement() ?? "bg1")
    @State private var session = MoltSession(id: UUID(), dateStarted: Date(), stressLevel: 10, goalLength: 120, length: 0, noteColor: .stickyYellow, journal: "")
    
    let completion: (MoltSession) -> ()
    
    var material: Material {
        switch sessionState {
        case .setup:
            return .ultraThick
        case .stress:
            return .thick
        case .relax:
            return .thick
        case .journal:
            return .thin
        case .complete:
            return .thin
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.clear
                    .background(
                        ZStack {
                            ParallaxImage(image)
                                .edgesIgnoringSafeArea(.all)
                            
                            if sessionState != .relax {
                                Color.clear.background(material)
                                    .edgesIgnoringSafeArea(.all)
                                    
                            }
                        }
                    )
                
                
                switch sessionState {
                case .setup:
                    SessionParameterView(goalLength: $session.goalLength, stressLevel: $session.stressLevel) { isSessionStarted in
                        withAnimation {
                            sessionState = isSessionStarted ? .stress : .complete
                        }
                    }
                case .stress:
                    StickyWall(stickies: .rainbow(count: session.stressLevel), frame: proxy.size) {
                        withAnimation {
                            sessionState = .relax
                        }
                    }
                case .relax:
                    SessionTimerView(totalTime: session.goalLength) { length in
                        session.length = length
                        withAnimation {
                            sessionState = .journal
                        }
                    }
                case .journal:
                    JournalEntryView(currentSession: $session) { isSessionLogged in
                        // save session
                        if isSessionLogged {
                            completion(session)
                        }
                        withAnimation {
                            sessionState = .complete
                        }
                    }
                case .complete:
                    // nothing
                    EmptyView()
                }
            }
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var sessionState = SessionState.setup
        
        var body: some View {
            SessionView(sessionState: $sessionState) { _ in 
                // do something
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
