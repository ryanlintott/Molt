//
//  ContentView.swift
//  Drafts
//
//  Created by EO on 06/11/21.
//

import SwiftUI

struct SessionTimerView: View {

   
    @Binding var time:Int
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
       ZStack {
           Image("foliage-bkgr")
               .resizable()
               .edgesIgnoringSafeArea(.all)
           
        VStack {
            Spacer()
            if time > 0 {
                Text("\(timeString(time: time))")
                    .font(.system(size: 72, weight: .black))
                    .monospacedDigit()
                    .foregroundStyle(.ultraThinMaterial)

            } else if time == 0 {
                Text("Completed!")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .padding(12)
            }
            
         HStack(spacing: 36) {
            
            Button("Stop") {
                stopTimer()
            }
            
            Button("Resume") {
                time = self.time
                startTimer()
            }
            
            Button ("Restart") {
                resetTimer()
            }
          }
        .glaced()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .padding(12)
        
        }
        
        .onReceive(timer) { time in
            if self.time > 0 {
                self.time -= 1
            }
        }
      }
        
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func resetTimer() {
        time = 0
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}



//struct SessionTimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionTimerView()
//    }
//}
struct GlassViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
            content
                .font(.title)
                .foregroundStyle(.thinMaterial)
                .padding()
                
        
    }
}

extension View {
    func glaced() -> some View {
        modifier(GlassViewModifier())
    }
}
