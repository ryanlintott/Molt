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
    @State private var isTimerRunning: Bool = true
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //@State private var feedback = UINotificationFeedbackGenerator()

    @State private var hapticManager: HapticManager?
    
    let completion: (Int) -> Void
    
    var body: some View {
        VStack {
            if let time = time {
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
                
                HStack(spacing: 28) {
                    if time > 0 {
                        if isTimerRunning {
                            Button("Pause") {
                                stopTimer()
                            }
                        } else {
                            Button("Resume") {
                                startTimer()
                            }
                        }
                    }
                    
                    Button("End") {
                        endSession()
                    }
                }
                .glaced()
                .foregroundColor(Color.gray)
                .background(.ultraThickMaterial)
                .cornerRadius(12)
                .padding(12)
            }
        }
        .onReceive(timer) { _ in
            hapticManager = HapticManager()
            if let time = time {
                if time > 0 {
                    self.time = time - 1
                    
                    if time == 2 {
                        hapticManager?.prepare()
                    }
                    
                    if time == 0 {
                        hapticManager?.customHapticPattern()
                        endSession()
                        print("Playing haptics")
                    }
                }
            }
        }
        .onAppear {
            time = totalTime
        }
    }
    
    func stopTimer() {
        timer.upstream.connect().cancel()
        isTimerRunning = false
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        isTimerRunning = true
    }
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func endSession() {
        stopTimer()
        completion(totalTime - (time ?? .zero))
    }
}

struct SessionTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image("bg1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            SessionTimerView(totalTime: 90) { time in
                // completion
            }
        }
    }
}
