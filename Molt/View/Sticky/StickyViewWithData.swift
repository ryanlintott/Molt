//
//  StickyViewWithData.swift
//  Molt
//
//  Created by Darshil Agrawal on 07/11/21.
//

import SwiftUI

struct StickyViewWithData: View {
    let session: MoltSession
    let curveFactor: CGFloat
    
    var body: some View {
        VStack {
            Text(dateStringGenerator(date:session.dateStarted))
                .fontWeight(.light)
            
            Spacer()
            
            Text(session.journal ?? "")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
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
        StickyViewWithData(session: .example, curveFactor: 0)
    }
}
