//
//  HapticManager.swift
//  Drafts
//
//  Created by EO on 07/11/21.
//

import Foundation
import CoreHaptics

class HapticManager {
    
    let hapticEngine: CHHapticEngine
    
    init?() {
        
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        guard hapticCapability.supportsHaptics else {
            return nil
        }
        
        do {
            hapticEngine = try CHHapticEngine()
        } catch let error {
            print("Haptic engine Creation Error: \(error)")
            return nil
        }
    }
    
    func prepare() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            try hapticEngine.start()
        } catch {
            print("Error creating engine")
        }
    }
    
    func customHapticPattern() {
        do {
            
            let pattern = try hapticOne()
            
            try hapticEngine.start()
            
            let player = try hapticEngine.makePlayer(with: pattern)
            
            try player.start(atTime: CHHapticTimeImmediate)
            
            hapticEngine.notifyWhenPlayersFinished { _ in
                return .stopEngine
            }
        } catch {
            print("Failed to play pattern: \(error)")
        }
    }
    
}

extension HapticManager {
    private func hapticOne() throws -> CHHapticPattern {
        let eventOne = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.50),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.00)
            ],
            relativeTime: 0.1,
            duration: 0.50)
        
        let eventTwo = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7)
            ],
            relativeTime: 0.7)
        
        return try CHHapticPattern(events: [eventOne, eventTwo], parameters: [])
    }
}


