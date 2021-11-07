//
//  MoltSession+example.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import Foundation

extension MoltSession {
    static var example: MoltSession {
        MoltSession(dateStarted: Date(), length: 110, goalLength: 120, journal: "This is some sort of example journal entry.")
    }
    
    static func example(journal: String? = "Example") -> MoltSession {
        let goal = Int.random(in: 1...10)
        let length = Int.random(in: 1...goal)
        let multiplier = 30
        return MoltSession(
            dateStarted: Date().addingTimeInterval(-TimeInterval.random(in: 0...10000)),
            length: Double(length * multiplier),
            goalLength: Double(goal * multiplier),
            journal: journal
        )
    }
    
    static var examples: [MoltSession] {
        [
            "Here is a first example.",
            "Here is a much longer example text. Multiple sentences that seem to run on and on. Wow, I love these long examples. I wonder when it will start to break the layout? Maybe now?",
            nil,
            "Couldn't be bothered to write anything above"
        ]
            .map {
                example(journal: $0)
            }
    }
}
