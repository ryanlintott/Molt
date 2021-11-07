//
//  StickyStackSlider.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

struct StickyStackSlider: View {
    @Binding var stressLevel: Int
    
    @GestureState private var isDragging: Bool = false
    @State private var dragStress: Int = .zero
    
    let minStress: Int
    let maxStress: Int
    
    var changingStressLevel: Int {
        cappedStress(stressLevel + dragStress)
    }
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                StickyStack(count: changingStressLevel, spacing: min(5, proxy.size.width / CGFloat(maxStress)), edge: .leading)
                Spacer()
            }
            .gesture(
                DragGesture()
                    .updating($isDragging) { value, gestureState, transaction in
                        gestureState = true
                    }
                    .onChanged { value in
                        let offsetPercent = value.translation.width / proxy.size.width
                        dragStress = Int(offsetPercent * CGFloat(maxStress - minStress))
                    }
            )
            .onChange(of: isDragging) { isDragging in
                if !isDragging {
                    stressLevel = cappedStress(stressLevel + dragStress)
                    dragStress = .zero
                }
            }
        }
        .contentShape(Rectangle())
        .frame(height: 60)
    }
    
    func cappedStress(_ value: Int) -> Int {
        min(max(minStress, value), maxStress)
    }
}

struct StickyStackSlider_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var stressLevel = 10
        
        var body: some View {
            StickyStackSlider(stressLevel: $stressLevel, minStress: 1, maxStress: 50)
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
