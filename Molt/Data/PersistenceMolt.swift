//
//  MoltDataController.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-10.
//

import Foundation

extension PersistenceCloudController {
    static let name = "MoltData"
    static let shared = PersistenceCloudController(name: name)
    
    static let preview = PersistenceCloudController.preview(name: name) { context in
        for session in MoltSession.examples {
            let moltSessionData = MoltSessionData(context: context)
            moltSessionData.setValues(from: session)
        }
    }
}
