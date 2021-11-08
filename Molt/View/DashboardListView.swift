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
        ScrollView {
            LazyVStack {
                ForEach(sessions,id: \.id){ session in
                    StickyViewWithData(session: .constant(session), curveFactor: 0)
                        .padding()
                }
            }
        }
    }
}

struct DashboardListView_Previews:
    PreviewProvider {
    static var previews: some View {
        DashboardListView(sessions: .examples)
    }
}
