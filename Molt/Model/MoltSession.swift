//
//  MoltSession.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import Foundation

public struct MoltSession: Identifiable {
    public var id = UUID()
    let dateStarted: Date
    let length: TimeInterval
    let goalLength: TimeInterval
    let noteColor: StickyColor
    let journal: String?
    
    var completed: Bool {
        length >= goalLength
    }
}
