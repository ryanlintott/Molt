//
//  DashedBorderEffect.swift
//  Molt
//
//  Created by Prabaljit Walia on 06/11/21.
//

import SwiftUI

struct DashedBorderEffect: View {
    @State private var phase: CGFloat = 0
    var lineWidth:CGFloat = 6
    var width:CGFloat = 200
    var height:CGFloat = 100
    var cornerRadius:CGFloat = 18
    var color:Color = .black
    var body: some View {
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: lineWidth, dash: [10,5], dashPhase: phase))
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
            .foregroundColor(color)
    }
    
}

struct DashedBorderEffect_Previews: PreviewProvider {
    static var previews: some View {
        DashedBorderEffect()
    }
}
