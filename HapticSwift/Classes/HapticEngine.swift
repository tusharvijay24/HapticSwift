//
//  HapticEngine.swift
//  HapticSwift
//
//  Created by Tushar on 31/01/25.
//

import Foundation
import CoreHaptics

public class HapticEngine {
    private var engine: CHHapticEngine?
    private var isDebugMode: Bool = false
    
    public init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            if isDebugMode {
                print("Haptic feedback not supported on this device.")
            }
            return
        }
        
        do {
            engine = try CHHapticEngine()
            startEngine()
        } catch {
            if isDebugMode {
                print("Failed to initialize haptic engine: \(error.localizedDescription)")
            }
        }
    }
    
    public func enableDebugMode(_ enable: Bool) {
        isDebugMode = enable
    }
    
    public func playCustomHaptic(intensity: Float, duration: TimeInterval) {
        guard let engine = engine else { return }
        
        do {
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: intensity)
            let intensityParam = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
            let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [sharpness, intensityParam], relativeTime: 0, duration: duration)
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try engine.makePlayer(with: pattern)
            try player.start(atTime: 0)
            
            if isDebugMode {
                print("Playing custom haptic with intensity: \(intensity), duration: \(duration)")
            }
        } catch {
            if isDebugMode {
                print("Failed to play custom haptic: \(error.localizedDescription)")
            }
        }
    }
    
    public func stopHaptic() {
        engine?.stop()
        engine = nil
        
        if isDebugMode {
            print("Haptic engine stopped")
        }
    }
    
    private func startEngine() {
        do {
            try engine?.start()
        } catch {
            if isDebugMode {
                print("Failed to start haptic engine: \(error.localizedDescription)")
            }
        }
    }
}
