//
//  ContentView.swift
//  Drafts
//
//  Created by EO on 06/11/21.
//

import SwiftUI

struct SessionTimerView: View {
    
    let totalTime: Int
    @State private var time: Int? = nil
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //@State private var feedback = UINotificationFeedbackGenerator()
    let backgroundImage: String
    @State private var hapticManager: HapticManager?
    var body: some View {
        ZStack {
            Image(backgroundImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                if let time = time {
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
                }
                
                HStack(spacing: 28) {
                    
                    Button("Stop") {
                        stopTimer()
                    }
                    .foregroundColor(Color.gray)
                    Button("Resume") {
                        startTimer()
                    }
                    .foregroundColor(Color.gray)
                }
                .glaced()
                .background(.ultraThickMaterial)
                .cornerRadius(12)
                .padding(12)
                
            }
            
            .onReceive(timer) { _ in
                hapticManager = HapticManager()
                if let time = time {
                    if time > 0 {
                        self.time = time - 1
                        
                        if time == 2 {
                            self.hapticManager?.prepare()
                        }
                        
                        if time == 0 {
                            self.hapticManager?.customHapticPattern()
                            print("Playing haptics")
                        }
                    }
                }
            }
            .onAppear {
                time = totalTime
            }
        }
        
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}

struct SessionTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SessionTimerView(totalTime: 90, backgroundImage: "bg1")
    }
}
