//
//  StickyWall.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct StickyWall: View {
    let stickies: [WallSticky]
    let frame: CGSize
    let stickySize: CGFloat = 100
    let dropHeight: CGFloat = 1000
    
    let completion: () -> Void
    
    @State private var stickyCount: Int = 0
    
    var body: some View {
        ZStack {
            Color.clear
            
            ForEach(stickies) { sticky in
                InteractiveStickyView(color: sticky.color, size: stickySize, dropHeight: dropHeight, curvePhase: sticky.curvePhase, imageName: randomImage()) {
                    stickyCount += 1
                    if stickyCount >= stickies.count {
                        completion()
                    }
                }
                .position(
                    x: frame.width * sticky.x,
                    y: frame.height * sticky.y
                )
            }
        }
        .padding(.vertical, stickySize / 3)
        .frame(width: frame.width, height: frame.height)
    }
}

struct StickyWall_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            StickyWall(stickies: .rainbow(count: 1), frame: proxy.size) {
                // complete
            }
        }
    }
}
