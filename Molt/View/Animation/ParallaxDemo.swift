//
//  ParallaxDemo.swift
//  Molt
//
//  Created by Prabaljit Walia on 06/11/21.
//

import SwiftUI

struct ParallaxDemo: View {
    @State var imageName:String = "testImage"
    @ObservedObject var manager = MotionManager()
    var body: some View {
        Image(imageName)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.all)
            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 10))
    }
}

struct ParallaxDemo_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxDemo()
    }
}
