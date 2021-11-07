//
//  JournalEntryView.swift
//  Molt
//
//  Created by Prabaljit Walia on 07/11/21.
//

import SwiftUI

struct JournalEntryView: View {
    @State private var journalText = "Note your Thoughts"
    @Binding var currentSession: MoltSession
    
    let completion: () -> Void
    
    var body: some View {
        VStack {
            StickyViewWithData(session: $currentSession, curveFactor: 0)
                .padding()
            
            ColorPickerView(chosenColor: $currentSession.noteColor)
                .frame(height: 50)
                .padding()
            
            Button("Submit") {
                completion()
            }
            .buttonStyle(DashedButtonStyle())
        
            Spacer()
        }
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    
    struct PreviewData: View {
        @State var currentSession: MoltSession = .example

        var body: some View {
            JournalEntryView( currentSession: $currentSession) {
                // Please Run
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
