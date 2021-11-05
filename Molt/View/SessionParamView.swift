//
//  SessionParamView.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct SessionParamView: View {
    @State private var hours = Calendar.current.component(.hour, from: Date())
       @State private var minutes = Calendar.current.component(.minute, from: Date())

       var body: some View {
           
           NavigationView {
               VStack {
                   Text("How distracted are you?")
                   Spacer()
                   TimePicker(selectedHour: $hours, selectedMinute: $minutes)
               }
               .navigationBarTitle("New Session")
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
