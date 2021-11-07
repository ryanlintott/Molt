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
    var gradient: LinearGradient {
        LinearGradient(stops: [.init(color: .white, location: curveFactor), .init(color: .white.opacity(0), location: 1)], startPoint: .bottom, endPoint: .top)
    }
    
    var imageName: String {
        randomImage()
    }
    
    var body: some View {
        ZStack {
            Sticky(curveFactor: 0)
                .fill(color)
            Sticky(curveFactor: 0)
                .fill(gradient)
                .opacity(0.3)
                .blendMode(.screen)
            VStack {
                Text(dateStringGenerator(date:sessionData.dateStarted))
                    .fontWeight(.light)
                Spacer()
                Text(sessionData.userNote)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack{
                    Spacer()
                        .frame(width:10)
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
                    
                    Spacer()
                        .frame(width:10)
                }
            }
        }.frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth - 20)
    }
}

struct StickyViewWithData_Previews: PreviewProvider {
    static var previews: some View {
        StickyViewWithData(color: .stickyBlue , curveFactor: 0, sessionData: MoltSession(dateStarted: Date.distantPast, length: 110, goalLength: 120, userNote: "Lorem Ipsum Bla bla bla gdsghsgd gdsgds asjkdh hsdjkhdkjhs jshdkjsahkdjh kjsdhkajshd kjdhsjkdhkajs hsjdhasjdh ahjdksjhdj", noteColor: .stickyBlue))
    }
}
