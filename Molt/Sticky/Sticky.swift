//
//  Sticky.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct Sticky: Shape {
    let curveFactor: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let curveAmount = curveFactor * rect.width * 0.5
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addCurve(
            to: CGPoint(x: rect.maxX + curveAmount, y: rect.maxY - abs(curveAmount * 0.5)),
            control1: CGPoint(x: rect.maxX, y: rect.minY + abs(curveAmount * 0.5)),
            control2: CGPoint(x: rect.maxX, y: rect.maxY - abs(curveAmount * 0.5))
        )
        path.addLine(to: CGPoint(x: rect.minX - curveAmount, y: rect.maxY - abs(curveAmount * 0.5)))
        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.minY),
            control1: CGPoint(x: rect.minX, y: rect.maxY - abs(curveAmount * 0.5)),
            control2: CGPoint(x: rect.minX, y: rect.minY + abs(curveAmount * 0.5))
        )
        path.closeSubpath()
        
        return path
    }
}
