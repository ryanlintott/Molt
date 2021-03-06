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
    
    let completion: (Bool) -> Void
    
    let minTime = 60
    let maxTime = 600
    let minStress = 1
    let maxStress = 50
    
    var body: some View {
        VStack {
            Text("New Session")
                .font(.system(size: 60, weight: .black, design: .rounded))
            
            Spacer()
            
            HStack(spacing:20) {
                Button {
                    if goalLength > minTime {
                        goalLength -= 60
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 40))
                }
                .foregroundColor(.black.opacity(goalLength == minTime ? 0.5 : 1))
                .disabled(goalLength == minTime)
                .padding()
                
                Text("**\(goalLength / 60) min**")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                
                Button {
                    if goalLength < maxTime {
                        goalLength += 60
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                }
                .foregroundColor(.black.opacity(goalLength == maxTime ? 0.5 : 1))
                .disabled(goalLength == maxTime)
                .padding()
            }
            
            Text("**Calm Time**")
                .font(.system(size: 30, weight: .black, design: .rounded))
                .padding(.bottom)
            
            StickyStackSlider(stressLevel: $stressLevel, minStress: minStress, maxStress: maxStress)
                .padding(.horizontal)
            
            Text("**Stress Level**")
                .font(.system(size: 30, weight: .black, design: .rounded))
            
            Button("Start") {
                completion(true)
            }
            .buttonStyle(DashedButtonStyle())
            .padding()
            
            Button {
                completion(false)
            } label: {
                Text("Cancel")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
    }
}

struct SessionParameterView_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var goalLength = 60
        @State private var stressLevel = 10
        
        var body: some View {
            SessionParameterView(goalLength: $goalLength, stressLevel: $stressLevel) { _ in
                // do something
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
