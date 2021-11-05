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

struct StickyView: View {
    @State private var curveFactor: CGFloat = -0.2
    
    let yellow = Color(red: 251/255, green: 236/255, blue: 93/255)
    let shadedYellow = Color(red: 239/255, green: 215/255, blue: 6/255)
    
    var body: some View {
        VStack {
            Spacer()
            
            Sticky(curveFactor: curveFactor)
                .stroke(Color.gray.opacity(0.3))
                .background(
                    Sticky(curveFactor: curveFactor)
                        .fill(LinearGradient(stops: [.init(color: shadedYellow, location: curveFactor), .init(color: yellow, location: 1)], startPoint: .bottom, endPoint: .top))
//                        .foregroundColor(.yellow)
                )
                .frame(width: 200, height: 200)

            Spacer()
            
            Slider(value: $curveFactor, in: -1...1)
                .padding()
        }
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        StickyView()
    }
}
