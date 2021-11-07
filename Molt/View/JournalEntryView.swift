//
//  JournalEntryView.swift
//  Molt
//
//  Created by Prabaljit Walia on 07/11/21.
//

import SwiftUI

struct JournalEntryView: View {
    @State private var journalText = "Thoughts..."
    @State var currentColor: Color = .clear
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    currentColor
                        .frame(width: 300, height: 200)
                    ColorPickerView(chosenColor: $currentColor)
                        .frame(width: 50, height: 200, alignment:.trailing)
                                    .offset(x: 150, y: 50)
                    
                    
                }
                
                
            }
            
        }
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView()
    }
}
