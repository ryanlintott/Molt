//
//  SessionParamView.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct SessionParamView: View {
    @State var hours = Calendar.current.component(.hour, from: Date())
       @State var minutes = Calendar.current.component(.minute, from: Date())
    
       var body: some View {
           
           NavigationView {
               VStack {
                   NavigationLink(destination: SessionStartView(hours: self.$hours, minutes: self.$minutes))
                   {
                       Text("How distracted are you?")
                       
                   }
                   //slider animation
                   SliderAnimation()
                   Spacer()
                   HStack(spacing:0) {
                       Text("**Time:**")
                       TimePicker(selectedHour: $hours, selectedMinute: $minutes)
                   }.padding(.horizontal)
               }
           }
       }
}

struct SessionParamView_Previews: PreviewProvider {
    static var previews: some View {
        SessionParamView()
    }
}
struct TimePicker: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Spacer()
                HStack(spacing:0) {
                    Picker("", selection: self.$selectedHour) {
                        ForEach(0..<24) {
                            Text(String($0)).tag($0)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: geometry.size.width / 5, height: 160)
                .clipped()
                    Text("hrs")
                        .opacity(0.5)
                        
                }
                HStack(spacing:0) {
                    Picker("", selection: self.$selectedMinute) {
                        ForEach(0..<60) {
                            Text(String($0)).tag($0)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: geometry.size.width / 5, height: 160)
                .clipped()
                    Text("min")
                        .opacity(0.5)
                }

                Spacer()
            }
        }
        .frame(height: 160)
        .mask(Rectangle())
    }
}
