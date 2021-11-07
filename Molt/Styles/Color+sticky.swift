//
//  Color+sticky.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

extension Color {
    static let stickyYellow = StickyColor.stickyYellow.color
    static let stickyBlue = StickyColor.stickyBlue.color
    static let stickyGreen = StickyColor.stickyGreen.color
    static let stickyPink = StickyColor.stickyPink.color
    static let stickyOrange = StickyColor.stickyOrange.color
    
    static let stickyColors = StickyColor.allCases.map { $0.color }
    
    static func stickyRainbow(count: Int) -> Array<Color> {
        guard count > 0 else {
            return []
        }
        let loops = count / stickyColors.count
        let excessCount = count - (loops * stickyColors.count)
        let excess = excessCount == 0 ? [] : Array(stickyColors[0...(excessCount - 1)])
        guard loops > 0 else {
            return excess
        }
        
        return Array(0...(loops - 1)).reduce([], { result, _ in result + stickyColors }) + excess
    }
}

enum StickyColor: String, CaseIterable, RawRepresentable {
    // Do not rename. These cases are linked to Core Data strings
    case stickyYellow
    case stickyBlue
    case stickyGreen
    case stickyPink
    case stickyOrange

    var color: Color {
        Color(rawValue)
    }
}


