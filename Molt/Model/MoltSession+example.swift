//
//  MoltSession+example.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import Foundation

extension MoltSession {
    static var example: MoltSession {
        MoltSession(dateStarted: Date(), stressLevel: 20, goalLength: 120, length: 110, noteColor: .stickyYellow, journal: "This is some sort of example journal entry.")
    }
    
    static func example(journal: String = "Example") -> MoltSession {
        let goalLength = Int.random(in: 1...10) * 60
        let length = [Int.random(in: 1...goalLength), goalLength].randomElement()!

        return MoltSession(
            dateStarted: Date().addingTimeInterval(-TimeInterval.random(in: 0...10000)),
            stressLevel: .random(in: 1...30),
            goalLength: goalLength,
            length: length,
            noteColor: .allCases.randomElement()!,
            journal: journal
        )
    }
    
    static var examples: [MoltSession] {
        [
            "Here is a first example.",
            "Here is a much longer example text. Multiple sentences that seem to run on and on. Wow, I love these long examples. I wonder when it will start to break the layout? Maybe now?",
            "",
            "Couldn't be bothered to write anything above"
        ]
            .map {
                example(journal: $0)
            }
    }
}

extension Collection where Element == MoltSession {
    static var examples: [MoltSession] {
        MoltSession.examples
    }
}
