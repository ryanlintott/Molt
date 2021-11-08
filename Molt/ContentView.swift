//
//  ContentView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
