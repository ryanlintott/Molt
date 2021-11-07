//
//  MoltSession.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-05.
//

import Foundation

struct MoltSession {
    let dateStarted: Date
    let length: TimeInterval
    let goalLength: TimeInterval
    let journal: String?
    
    var completed: Bool {
        length > goalLength
    }
}
