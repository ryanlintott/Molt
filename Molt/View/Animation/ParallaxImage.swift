//
//  ParallaxImage.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-10.
//

import SwiftUI

struct ParallaxImage: View {
    let image: Image
    let magnitude: CGFloat
    
    @StateObject var motionManager = MotionManager()
    
    init(_ image: Image, magnitude: CGFloat = 10) {
        self.image = image
        self.magnitude = magnitude
    }
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .padding(-magnitude)
            .modifier(ParallaxMotionModifier(manager: motionManager, magnitude: magnitude))
    }
}

struct ParallaxImage_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxImage(Image(systemName: "gear"))
    }
}
