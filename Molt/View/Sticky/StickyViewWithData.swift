//
//  StickyViewWithData.swift
//  Molt
//
//  Created by Darshil Agrawal on 07/11/21.
//

import SwiftUI

struct StickyViewWithData: View {
    let color: Color
    let curveFactor: CGFloat
    let sessionData: MoltSession
    
    var body: some View {
        VStack {
            Text(dateStringGenerator(date:sessionData.dateStarted))
                .fontWeight(.light)
            
            Spacer()
            
            Text(sessionData.userNote)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack{
                Text("Timing")
                
                Spacer()
                
                if sessionData.completed {
                    HStack{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.white)
                        Text(sessionData.goalLength.description)
                        
                    }
                } else {
                    Text("\(sessionData.length.description) / \(sessionData.goalLength.description)")
                }
            }
        }
        .padding()
        .background(
            StickyView(color: color, curveFactor: curveFactor, imageName: nil)
        )
        .aspectRatio(1, contentMode: .fit)
    }
}

struct StickyViewWithData_Previews: PreviewProvider {
    static var previews: some View {
        StickyViewWithData(color: .stickyBlue , curveFactor: 0, sessionData: MoltSession(dateStarted: Date.distantPast, length: 110, goalLength: 120, userNote: "Lorem Ipsum Bla bla bla gdsghsgd gdsgds asjkdh hsdjkhdkjhs jshdkjsahkdjh kjsdhkajshd kjdhsjkdhkajs hsjdhasjdh ahjdksjhdj", noteColor: .stickyBlue))
    }
}
