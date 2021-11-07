//
//  MoltSessionData.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import CoreData
import Foundation

extension MoltSessionData {
    public var session: MoltSession? {
        guard
            let dateStarted = dateStarted,
            let noteColor = noteColor,
            let journal = journal
        else {
            return nil
        }
        guard let stickyColor = StickyColor(rawValue: noteColor) else {
            return nil
        }
        
        return MoltSession(dateStarted: dateStarted, stressLevel: Int(stressLevel), goalLength: Int(goalLength), length: Int(length), noteColor: stickyColor, journal: journal)
    }
    
    convenience init(context: NSManagedObjectContext, from session: MoltSession) {
        self.init(context: context)
        self.setValues(from: session)
    }
    
    func setValues(from session: MoltSession) {
        dateStarted = session.dateStarted
        stressLevel = Int16(session.stressLevel)
        length = Int16(session.length)
        goalLength = Int16(session.goalLength)
        journal = session.journal
        noteColor = session.noteColor.rawValue
    }
}
