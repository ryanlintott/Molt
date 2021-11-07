//
//  SessionParamView.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct SessionParameterView: View {
    @Binding var goalLength: Int
    @Binding var stressLevel: Int
    
    let startSession: () -> Void
    
    let minTime = 60
    let maxTime = 600
    let minStress = 1
    let maxStress = 50
    
    let images = ["bg1","bg2","bg3","bg4","bg5","bg6","bg7","bg8","bg9","bg10","bg11","bg12","bg13","bg14"]
    
    var body: some View {
        VStack {
            HStack(spacing:20) {
                Button {
                    if goalLength > minTime {
                        goalLength -= 60
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                }
                .padding()
                
                Text("**\(goalLength / 60) min**")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                
                Button {
                    if goalLength < maxTime {
                        goalLength += 60
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                }
                .padding()
            }
            
            Text("**Calm Time**")
                .font(.system(size: 30, weight: .black, design: .rounded))
            
            StickyStackSlider(stressLevel: $stressLevel, minStress: minStress, maxStress: maxStress)
                .padding()
            
            Text("**Stress Level**")
                .font(.system(size: 30, weight: .black, design: .rounded))
            Button("Start") {
                startSession()
            }
            .buttonStyle(DashedButtonStyle())
            .padding()
        }
    }
}
    struct PreviewData: View {
        @State private var goalLength = 60
        @State private var stressLevel = 10
        
        var body: some View {
            SessionParameterView(goalLength: $goalLength, stressLevel: $stressLevel) {
                print("start session")
            }
        }
    }
    
    }
        PreviewData()
    static var previews: some View {
        PreviewData()
    }
}
