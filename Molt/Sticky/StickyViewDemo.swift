//
//  StickyViewDemo.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

struct StickyViewDemo: View {
    @State private var curveFactor: CGFloat = 0.2
    
    var body: some View {
        VStack {
            Spacer()
            
            StickyView(color: .yellow, curveFactor: $curveFactor)
                .frame(width: 200, height: 200)

            Spacer()
            
            Slider(value: $curveFactor, in: -1...1)
                .padding()
        }
    }
}

struct StickyViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        StickyViewDemo()
    }
}
