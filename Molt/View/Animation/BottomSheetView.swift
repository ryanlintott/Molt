//
//  BottomSheetView.swift
//  Molt
//
//  Created by Prabaljit Walia on 07/11/21.
//

import SwiftUI

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 32
    static let indicatorHeight: CGFloat = 8
    static let indicatorWidth: CGFloat = 80
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool

    let closedOffset: CGFloat
    let openOffset: CGFloat
    let content: () -> Content

    @GestureState private var isDragging = false
    @State private var dragOffset: CGFloat = .zero

    var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.white)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        )
    }

    var body: some View {
        GeometryReader { proxy in
            VStack {
                indicator
                    .padding()
                    .onTapGesture {
                        withAnimation(.interactiveSpring()) {
                            isOpen.toggle()
                        }
                    }
                
                Color.clear
                    .overlay(
                        content()
                    )
                
                Spacer(minLength: 0)
            }
            .padding(.top, openOffset)
            .background(
                ZStack(alignment: .bottom) {
                    Color.black
                        .cornerRadius(Constants.radius)
                    
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: Constants.radius)
                }
            )
            .offset(y: min(max(0, (isOpen ? 0 : proxy.size.height - openOffset - closedOffset) + dragOffset), proxy.size.height))
            .gesture(
                DragGesture()
                    .updating($isDragging) { value, state, transaction in
                        state = true
                    }
                    .onChanged { value in
                        dragOffset = value.translation.height
                    }
            )
            .onChange(of: isDragging) { value in
                if !isDragging {
                    withAnimation(.interactiveSpring()) {
                        let snapDistance = (proxy.size.height - openOffset - closedOffset) * Constants.snapRatio
                        if abs(dragOffset) > snapDistance {
                            isOpen.toggle()
                        }
                        dragOffset = 0
                    }
                }
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var isOpen = true
        
        var body: some View {
            GeometryReader { proxy in
                BottomSheetView(isOpen: $isOpen, closedOffset: 200, openOffset: 0) {
                    Color.red.padding()
                }
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
