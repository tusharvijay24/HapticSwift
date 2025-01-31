//
//  HapticSwift.swift
//  HapticSwift
//
//  Created by Tushar on 31/01/25.
//

import Foundation

public class HapticSwift {
    private static var hapticEngine = HapticEngine()
    private static var isDebugMode = false 
    
    public static func enableDebugMode(_ enable: Bool) {
        isDebugMode = enable
        hapticEngine.enableDebugMode(enable)
    }
    
    public static func trigger(_ type: HapticType) {
        switch type {
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .custom(let intensity, let duration):
            hapticEngine.playCustomHaptic(intensity: intensity, duration: duration)
        }
        
        if isDebugMode {
            print("Haptic triggered: \(type)")
        }
    }
    
    public static func stopCustomHaptic() {
        hapticEngine.stopHaptic()
    }
}
