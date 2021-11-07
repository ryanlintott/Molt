//
//  MoltSession.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import Foundation

public struct MoltSession: Identifiable {
    public let id = UUID()
    var dateStarted: Date
    var stressLevel: Int
    var goalLength: Int
    var length: Int
    var noteColor: StickyColor
    var journal: String
    
    var completed: Bool {
        length >= goalLength
    }
}
