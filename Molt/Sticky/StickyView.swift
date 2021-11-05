//
//  StickyView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct StickyView: View {
    @Binding var curveFactor: CGFloat
    
    
    var gradient: LinearGradient {
        let yellow = Color(red: 251/255, green: 236/255, blue: 93/255)
        let shadedYellow = Color(red: 239/255, green: 215/255, blue: 6/255)
        
        return LinearGradient(stops: [.init(color: yellow, location: curveFactor), .init(color: shadedYellow, location: 1)], startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        Sticky(curveFactor: curveFactor)
            .stroke(Color.gray.opacity(0.3))
            .background(
                Sticky(curveFactor: curveFactor)
                    .fill(gradient)
            )
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        StickyView(curveFactor: .constant(0.2))
            .frame(width: 200, height: 200)
    }
}
