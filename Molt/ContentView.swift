//
//  ContentView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            StickyWall(stickies: .rainbow(count: 25), frame: proxy.size)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
