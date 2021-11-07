//
//  StickyView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct StickyView: View {
    let color: Color
    let curveFactor: CGFloat
    let imageName: String?
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
                .stroke(Color.gray.opacity(0.1))
            if let image = imageName {
            Image(image)
                .resizable()
                .scaledToFit()
            }
        }
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        StickyView(color: .stickyYellow, curveFactor: 0.2, imageName: "scribble1")
                .frame(width: 200, height: 200)
    }
}
