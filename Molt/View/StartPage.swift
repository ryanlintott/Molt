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
                NavigationLink(destination: SessionParameterView()) {
                    Text("Start a Session")
                }
                    .padding()
                //change destination when DashboardView is completed
                NavigationLink(destination: SessionParameterView()) {
                    ZStack {
                        Text("**Summary**")
                            .foregroundColor(.black)
                        DashedBorderEffect(lineWidth: 6, width: 200, height: 100, cornerRadius: 18, color: .black)
                    }
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
