//
//  StickyWall.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct WallSticky: Identifiable {
    let id: UUID
    let color: Color
    let x: CGFloat
    let y: CGFloat
    let curvePhase: CGFloat
    
    init(id: UUID = UUID(), color: Color, x: CGFloat, y: CGFloat, curvePhase: CGFloat = CGFloat.random(in: 0...1)) {
        self.id = id
        self.color = color
        self.x = x
        self.y = y
        self.curvePhase = curvePhase
    }
}

struct StickyWall: View {
    @Binding var stickies: [WallSticky]
    let curveFactor: CGFloat
    let phase: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                ForEach(stickies) { sticky in
                    StickyView(color: sticky.color, curveFactor: abs((phase + sticky.curvePhase).truncatingRemainder(dividingBy: 2) - 1) * curveFactor)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            stickies
                                .removeAll(where: { $0.id == sticky.id })
                        }
                        .position(
                            x: proxy.size.width * sticky.x,
                            y: proxy.size.height * sticky.y
                        )
                }
            }
        }
    }
}

struct StickyWall_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var stickies = Color
            .stickyRainbow(count: 25).map {
                WallSticky(
                    color: $0,
                    x: CGFloat.random(in: 0...1),
                    y: CGFloat.random(in: 0...1)
                )
            }
            .sorted(by: { lhs, rhs in
                lhs.y > rhs.y
            })
        
        @State private var phase: CGFloat = 0
        
        var body: some View {
            StickyWall(stickies: $stickies, curveFactor: 0.2, phase: phase)
                .overlay(
                    Slider(value: $phase, in: 0...10)
                        .padding()
                    , alignment: .bottom
                )
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
