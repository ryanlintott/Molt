//
//  StartPage.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SessionParamView()) {
                    Text("Start a Session")
                }
                    .padding()
                //change destination when DashboardView is completed
                NavigationLink(destination: SessionParamView()) {
                    Text("View Summary")
                }
            }
            .navigationBarTitle("Hello")
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
