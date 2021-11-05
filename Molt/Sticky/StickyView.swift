//
//  StickyView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct StickyView: View {
    let color: Color
    @Binding var curveFactor: CGFloat
    
    var gradient: LinearGradient {
        LinearGradient(stops: [.init(color: .white, location: curveFactor), .init(color: .white.opacity(0), location: 1)], startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        ZStack {
            Sticky(curveFactor: curveFactor)
                .fill(color)
            
            Sticky(curveFactor: curveFactor)
                .fill(gradient)
                .opacity(0.3)
                .blendMode(.screen)
            
            Sticky(curveFactor: curveFactor)
                .stroke(Color.gray.opacity(0.3))
        }
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        StickyView(color: .yellow, curveFactor: .constant(0.2))
                .frame(width: 200, height: 200)
    }
}
