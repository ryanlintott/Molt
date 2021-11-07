//
//  Color+sticky.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import SwiftUI

extension Color {
    static let stickyYellow = Color("stickyYellow")
    static let stickyBlue = Color("stickyBlue")
    static let stickyGreen = Color("stickyGreen")
    static let stickyPink = Color("stickyPink")
    static let stickyOrange = Color("stickyOrange")
    
    static let stickyColors = [stickyYellow, stickyBlue, stickyGreen, stickyPink, stickyOrange]
    
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
