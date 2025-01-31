//
//  HapticType.swift
//  HapticSwift
//
//  Created by Tushar on 31/01/25.
//

import Foundation

public enum HapticType {
    case light, medium, heavy
    case success, warning, error
    case selection
    case custom(intensity: Float, duration: TimeInterval)
}
