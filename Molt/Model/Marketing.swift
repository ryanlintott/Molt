//
//  Marketing.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-15.
//

import Foundation

#if targetEnvironment(simulator)
extension MoltSession {
    init!(_ year: Int, _ month: Int, _ day: Int, _ hour: Int, _ minute: Int, stressLevel: Int, goalLength: Int, length: Int, noteColor: StickyColor, journal: String) {
        guard let date = DateComponents(calendar: .current, year: year, month: month, day: day, hour: hour, minute: minute).date else {
            return nil
        }
        
        self = Self(id: UUID(), dateStarted: date, stressLevel: stressLevel, goalLength: goalLength, length: length, noteColor: noteColor, journal: journal)
    }
}

struct MarketingSession {
    static let sampleData: [MoltSession] = [
        MoltSession(2021, 11, 7, 17, 58, stressLevel: 50, goalLength: 120, length: 120, noteColor: .stickyYellow, journal: "The SwiftUI Jam deadline was on my mind."),
        MoltSession(2021, 11, 6, 20, 45, stressLevel: 10, goalLength: 240, length: 207, noteColor: .stickyPink, journal: "I wonder what the movie night will be like..."),
        MoltSession(2021, 11, 5, 9, 46, stressLevel: 15, goalLength: 60, length: 60, noteColor: .stickyGreen, journal: "Jam is starting soon. Is our design ready."),
        MoltSession(2021, 11, 4, 23, 00, stressLevel: 5, goalLength: 240, length: 240, noteColor: .stickyBlue, journal: "Looking forward to the Jam tomorrow with my team +="),
        MoltSession(2021, 11, 3, 9, 34, stressLevel: 35, goalLength: 360, length: 154, noteColor: .stickyOrange, journal: "Got distracted by my cat.")
    ]
}
#endif
