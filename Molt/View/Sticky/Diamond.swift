//
//  StackableSticky.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addLines([
            CGPoint(x: rect.midX, y: rect.minY),
            CGPoint(x: rect.maxX, y: rect.midY),
            CGPoint(x: rect.midX, y: rect.maxY),
            CGPoint(x: rect.minX, y: rect.midY)
        ])
        path.closeSubpath()
        return path
    }
    
    
}

struct StackableSticky_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
            .fill()
            .frame(width: 100, height: 50)
    }
}
