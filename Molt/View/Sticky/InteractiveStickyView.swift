//
//  InteractiveStickyView.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-06.
//

import SwiftUI

struct InteractiveStickyView: View {
    @GestureState private var isDragging: Bool = false
    @State private var predictedDragOffset: CGSize = .zero
    @State private var dragOffset: CGSize = .zero
    @State private var finalOffset: CGSize? = nil
    @State private var isHovering: Bool = false
    @State private var flutterPhase: CGFloat = 0
    
    let color: Color
    let size: CGFloat
    let dropHeight: CGFloat
    let curvePhase: CGFloat
    
    var curveFactor: CGFloat {
        if finalOffset == nil {
            return min(max(0, 0.1 + (predictedDragOffset.height - dragOffset.height) / 300), 0.4)
        } else {
            return abs((flutterPhase + curvePhase).truncatingRemainder(dividingBy: 2) - 1) * 0.2
        }
    }

    var dragSticky: some Gesture {
        DragGesture()
            .updating($isDragging) { value, gestureState, transation in
                gestureState = true
            }
            .onChanged { value in
                if !isHovering {
                    isHovering = true
                }
                predictedDragOffset = value.predictedEndTranslation
                dragOffset = value.translation
            }
    }
    
    var body: some View {
        StickyView(color: color, curveFactor: curveFactor)
            .background(
                Color.black.opacity(0.2)
                    .mask(StickyView(color: color, curveFactor: curveFactor))
                    .blur(radius: isHovering ? 6 : 2)
                    .padding(.top, 2)
                    .padding(.bottom, -2)
            )
            .scaleEffect(isHovering ? 1.1 : 1)
            .frame(width: size, height: size)
            .offset(finalOffset ?? dragOffset)
            .onTapGesture {
                withAnimation {
                    isHovering = true
                }
                withAnimation(.easeIn(duration: 0.8)) {
                    finalOffset = CGSize(width: 0, height: dropHeight)
                }
            }
            .onChange(of: isDragging) { isDragging in
                if !isDragging {
                    withAnimation(.easeIn(duration: 0.8)) {
                        finalOffset = CGSize(width: predictedDragOffset.width, height: dropHeight)
                    }
                } else {
                    isHovering = true
                }
            }
            .gesture(dragSticky)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    flutterPhase = 1
                }
            }
    }
}

struct InteractiveStickyView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveStickyView(color: .stickyYellow, size: 100, dropHeight: 1000, curvePhase: 0)
    }
}
