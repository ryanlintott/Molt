//
//  WallSticky.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct WallSticky: Identifiable, Hashable {
    let id: Int
    let color: Color
    var x: CGFloat
    var y: CGFloat
    var curvePhase: CGFloat
    
    init(id: Int, color: Color, x: CGFloat, y: CGFloat, curvePhase: CGFloat = CGFloat.random(in: 0...1)) {
        self.id = id
        self.color = color
        self.x = x
        self.y = y
        self.curvePhase = curvePhase
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Array where Element == WallSticky {
    static func rainbow(count: Int, aspectRatio: CGFloat = 1) -> Self {
        let positions = Array<Int>(0..<count).map {
            CGPoint(x: CGFloat.random(in: 0...1), y: CGFloat($0) / CGFloat(count))
        }
        .shuffled()
        
        let colors = Color.stickyRainbow(count: count)
        
        return zip(colors, positions)
            .enumerated()
            .map {
                WallSticky(
                    id: $0,
                    color: $1.0,
                    x: $1.1.x,
                    y: $1.1.y
                )
            }
            .sorted(by: { lhs, rhs in
                lhs.y > rhs.y
            })
    }
}
