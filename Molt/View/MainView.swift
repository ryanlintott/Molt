//
//  MainView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

struct MainView: View {
    @State private var isShowingSession = false
    
    
    var body: some View {
        ZStack {
            StartPage()
            
//            SessionView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
