//
//  StickyViewWithData.swift
//  Molt
//
//  Created by Darshil Agrawal on 07/11/21.
//

import SwiftUI

struct StickyViewWithData: View {
    @Binding var session: MoltSession
    let curveFactor: CGFloat
    let isEditable: Bool
    
    init(session: Binding<MoltSession>, curveFactor: CGFloat, isEditable: Bool = false) {
        self._session = session
        self.curveFactor = curveFactor
        self.isEditable = isEditable
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            Text(dateStringGenerator(date:session.dateStarted))
                .fontWeight(.light)
            
            Spacer()
            
            Group {
                if isEditable {
                    TextEditor(text: $session.journal)
                } else {
                    Text(session.journal)
                }
            }
            .font(.body.weight(.medium))
            
            Spacer()
            
            HStack{
                Text("Timing")
                
                Spacer()
                
                if session.completed {
                    HStack{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.white)
                        Text(session.goalLength.description)
                        
                    }
                } else {
                    Text("\(session.length.description) / \(session.goalLength.description)")
                }
            }
        }
        .padding()
        .background(
            StickyView(color: session.noteColor.color, curveFactor: curveFactor, imageName: nil)
        )
        .aspectRatio(1, contentMode: .fit)
    }
}

struct StickyViewWithData_Previews: PreviewProvider {
    static var previews: some View {
        StickyViewWithData(session: .constant(.example), curveFactor: 0)
        
        StickyViewWithData(session: .constant(.example), curveFactor: 0, isEditable: true)
    }
}
