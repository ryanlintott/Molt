//
//  SessionBottomSlider.swift
//  Molt
//
//  Created by Prabaljit Walia on 06/11/21.
//

import SwiftUI

struct SessionBottomSlider: View {
    @State private var offsets = (top: CGFloat.zero, middle: CGFloat.zero, bottom: CGFloat.zero)
        @State private var offset: CGFloat = .zero
        @State private var lastOffset: CGFloat = .zero
        
        var body: some View {
            GeometryReader { geometry in
                VStack (spacing: 30) {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 10)
                    Text("Sessions")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: min(self.offset, 20) ))
                .animation(.interactiveSpring())
                .onAppear {
                    self.offsets = (
                        top: .zero,
                        middle: geometry.size.height / 2,
                        bottom: geometry.size.height * 3 / 4
                    )
                    self.offset = self.offsets.bottom
                    self.lastOffset = self.offset
                }
                .offset(y: self.offset)
                .gesture(DragGesture(minimumDistance: 5)
                    .onChanged { v in
                        let newOffset = self.lastOffset + v.translation.height
                        if (newOffset > self.offsets.top && newOffset < self.offsets.bottom) {
                            self.offset = newOffset
                        }
                    }
                    .onEnded{ v in
                        if (self.lastOffset == self.offsets.top && v.translation.height > 0) {
                            if (v.translation.height < geometry.size.height / 2) {
                                self.offset = self.offsets.middle
                            } else {
                                self.offset = self.offsets.bottom
                            }
                        } else if (self.lastOffset == self.offsets.middle) {
                            if (v.translation.height < 0) {
                                self.offset = self.offsets.top
                            } else {
                                self.offset = self.offsets.bottom
                            }
                        } else if (self.lastOffset == self.offsets.bottom && v.translation.height < 0) {
                            if (abs(v.translation.height) > geometry.size.height / 2) {
                                self.offset = self.offsets.top
                            } else {
                                self.offset = self.offsets.middle
                            }
                        }
                        self.lastOffset = self.offset
                    }
                )
            }
            .edgesIgnoringSafeArea(.all)
        }
}

struct SessionBottomSlider_Previews: PreviewProvider {
    static var previews: some View {
        SessionBottomSlider()
    }
}
