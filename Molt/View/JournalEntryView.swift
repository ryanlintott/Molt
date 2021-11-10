//
//  JournalEntryView.swift
//  Molt
//
//  Created by Prabaljit Walia on 07/11/21.
//

import SwiftUI

struct JournalEntryView: View {
    @Binding var currentSession: MoltSession
    
    let completion: (Bool) -> Void
    
    var body: some View {
        VStack {
            StickyViewWithData(session: $currentSession, curveFactor: 0, isEditable: true)
                .padding(.horizontal)
            
            ColorPickerView(chosenColor: $currentSession.noteColor)
                .frame(height: 50)
                .padding(5)
            
            Button("Submit") {
                completion(true)
            }
            .buttonStyle(DashedButtonStyle())
            
            Button {
                completion(false)
            } label: {
                Text("Cancel")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
            .padding()
        
            Spacer()
        }
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    
    struct PreviewData: View {
        @State var currentSession: MoltSession = .example

        var body: some View {
            JournalEntryView( currentSession: $currentSession) { _ in 
                // Please Run
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
