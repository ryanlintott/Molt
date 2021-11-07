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
    let stressLevel: Int
    let goalLength: Int
    let length: Int
    var noteColor: StickyColor
    var journal: String?
    
    var completed: Bool {
        length >= goalLength
    }
}
