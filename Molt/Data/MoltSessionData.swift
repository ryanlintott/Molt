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
            let noteColor = noteColor
        else {
            return nil
        }
        guard let stickyColor = StickyColor(rawValue: noteColor) else {
            return nil
        }
        
        return MoltSession(dateStarted: dateStarted, length: length, goalLength: goalLength, noteColor: stickyColor, journal: journal)
    }
    
    convenience init(context: NSManagedObjectContext, from session: MoltSession) {
        self.init(context: context)
        self.setValues(from: session)
    }
    
    func setValues(from session: MoltSession) {
        dateStarted = session.dateStarted
        length = session.length
        goalLength = session.goalLength
        journal = session.journal
        noteColor = session.noteColor.rawValue
    }
}
