//
//  SliderAnimation.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct SliderAnimation: View {
    @State var maxHeight = UIScreen.main.bounds.height/3
    //progress
    @State var sliderProgress:CGFloat = 0
    @State var sliderHeight:CGFloat = 0
    @State var lastDragValue:CGFloat = 0
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom, content: {
                    Rectangle()
                        .fill(Color.blue.opacity(0.15))
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height:sliderHeight)
                })
                    .frame(width: 100, height: maxHeight)
                    .cornerRadius(35)
                //container
                    .overlay(
                    Text("\(Int(sliderProgress*100))")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal,18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical,25)
                        .offset(y: sliderHeight < maxHeight-105 ? -sliderHeight: -maxHeight+105)
                    )
                    .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                        //getting drag value
                        let translation = value.translation
                        sliderHeight = -translation.height + lastDragValue
                        //limiting slider height
                        sliderHeight = sliderHeight>maxHeight ? maxHeight:sliderHeight
                        
                        sliderHeight = sliderHeight >= 0 ? sliderHeight:0
                        //updating progress
                        let progress = sliderHeight/maxHeight
                        sliderProgress = progress <= 1 ? progress:1
                    }).onEnded({ (value) in
                        //storing last drag value
                        
                        sliderHeight = sliderHeight>maxHeight ? maxHeight:sliderHeight
                        lastDragValue = sliderHeight
                        
                        //negative height
                        sliderHeight = sliderHeight >= 0 ? sliderHeight:0
                        lastDragValue = sliderHeight
                        
                    }))
                    
            }

        }
    }
}

struct SliderAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SliderAnimation()
    }
}
