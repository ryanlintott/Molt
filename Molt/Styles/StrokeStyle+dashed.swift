//
//  StrokeStyle+dashed.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

extension StrokeStyle {
    static func moltDashed(lineWidth: CGFloat? = nil, phase: CGFloat? = nil) -> StrokeStyle {
        StrokeStyle(lineWidth: lineWidth ?? 10, lineCap: .round, lineJoin: .round, dash: [20,20], dashPhase: phase ?? 0)
    }
}

struct StrokeStyle_dashed_Previews: PreviewProvider {
    static var previews: some View {
        Text("test")
            .font(.system(size: 40, weight: .black, design: .rounded))
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .strokeBorder(style: .moltDashed(phase: 0))
            )
    }
}
