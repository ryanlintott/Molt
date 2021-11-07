//
//  DashboardListView.swift
//  Molt
//
//  Created by Darshil Agrawal on 06/11/21.
//

import SwiftUI

struct DashboardListView: View {
    let sessions: [MoltSession]
    var body: some View {
        List{
            ForEach(sessions,id: \.id){ session in
                StickyViewWithData(color: session.noteColor.rawValue, curveFactor: 0, sessionData: session)
            }
        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
    }
}

struct DashboardListView_Previews:
    PreviewProvider {
    static var previews: some View {
        DashboardListView(sessions: [MoltSession(dateStarted: Date.distantPast, length: 110, goalLength: 120, userNote: "Lorem Ipsum Bla bla bla gdsghsgd gdsgds asjkdh hsdjkhdkjhs jshdkjsahkdjh kjsdhkajshd kjdhsjkdhkajs hsjdhasjdh ahjdksjhdj", noteColor: .stickyBlue),MoltSession(dateStarted: Date.distantPast, length: 110, goalLength: 120, userNote: "Lorem Ipsum Bla bla bla gdsghsgd gdsgds asjkdh hsdjkhdkjhs jshdkjsahkdjh kjsdhkajshd kjdhsjkdhkajs hsjdhasjdh ahjdksjhdj", noteColor: .stickyBlue),MoltSession(dateStarted: Date.distantPast, length: 110, goalLength: 120, userNote: "Lorem Ipsum Bla bla bla gdsghsgd gdsgds asjkdh hsdjkhdkjhs jshdkjsahkdjh kjsdhkajshd kjdhsjkdhkajs hsjdhasjdh ahjdksjhdj", noteColor: .stickyBlue)])
    }
}
