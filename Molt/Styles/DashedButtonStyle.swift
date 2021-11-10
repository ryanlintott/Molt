//
//  DashedButtonStyle.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct DashedButtonStyle: ButtonStyle {
    let lineWidth: CGFloat?
    let cornerRadius: CGFloat
    
    init(lineWidth: CGFloat? = nil, cornerRadius: CGFloat? = nil) {
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius ?? 30
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 40, weight: .black, design: .rounded))
            .foregroundColor(.black)
            .padding(cornerRadius)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(style: .moltDashed(lineWidth: lineWidth, phase: configuration.isPressed ? 50 : 0))
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct DashedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Dashed") {
            print("Test")
        }
        .buttonStyle(DashedButtonStyle())
    }
}
