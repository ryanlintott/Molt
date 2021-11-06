//
//  StickyWall.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct StickyWall: View {
    @State var activeSticky: WallSticky? = nil
    @Binding var stickies: [WallSticky]
    let stickySize: CGFloat = 100
    let curveFactor: CGFloat
    let phase: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.clear
                
                ForEach(stickies) { sticky in
                    StickyView(color: sticky.color, curveFactor: abs((phase + sticky.curvePhase).truncatingRemainder(dividingBy: 2) - 1) * curveFactor)
                        .frame(width: stickySize, height: stickySize)
                        .position(
                            x: proxy.size.width * sticky.x,
                            y: proxy.size.height * sticky.y
                        )
                        .onTapGesture {
                            activeSticky = sticky
                            stickies.removeAll(where: { $0.id == sticky.id })
                            withAnimation(.easeIn) {
                                activeSticky?.y = proxy.size.height + stickySize
                            }
                        }
                }
                
                if let sticky = activeSticky {
                    StickyView(color: sticky.color, curveFactor: abs((phase + sticky.curvePhase).truncatingRemainder(dividingBy: 2) - 1) * curveFactor)
                        .frame(width: stickySize, height: stickySize)
                        .position(
                            x: proxy.size.width * sticky.x,
                            y: proxy.size.height * sticky.y
                        )
                }
            }
        }
        .border(.red)
        .padding(.vertical, stickySize / 4)
    }
}

struct StickyWall_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var stickies: [WallSticky] = .rainbow(count: 25)
        
        
//        Color
//            .stickyRainbow(count: 25)
//            .enumerated()
//            .map {
//                WallSticky(
//                    id: $0,
//                    color: $1,
//                    x: CGFloat.random(in: 0...1),
//                    y: CGFloat.random(in: 0...1)
//                )
//            }
//            .sorted(by: { lhs, rhs in
//                lhs.y > rhs.y
//            })
        
        @State private var phase: CGFloat = 0
        
        var body: some View {
            StickyWall(stickies: $stickies, curveFactor: 0.2, phase: phase)
                .overlay(
                    Slider(value: $phase, in: 0...10)
                        .padding()
                    , alignment: .bottom
                )
                .onAppear {
                    withAnimation(.linear(duration: 2)) {
                        phase = 1
                    }
                }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
