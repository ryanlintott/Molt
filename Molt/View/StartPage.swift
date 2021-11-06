//
//  StartPage.swift
//  Molt
//
//  Created by Prabaljit Walia on 05/11/21.
//

import SwiftUI

struct StartPage: View {
    @State var showSessionStart = false
    var body: some View {
        NavigationView {
            
            VStack {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 180, alignment: .center)
                Spacer()
                
                //change destination when DashboardView is completed
                Button("Begin",action: {
                    self.showSessionStart = true
                }).buttonStyle(DashedButtonStyle())
                Spacer()
                
                ZStack {
                    CardView()
                        .edgesIgnoringSafeArea(.bottom)
                        .frame(maxHeight:150)
                    NavigationLink(destination: SessionParamView()) {
                        Text("**Sessions**")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }

                }
            }
        }.fullScreenCover(isPresented:self.$showSessionStart){
            SessionParamView()
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
struct CardView: View{
    var body: some View{
        ZStack{
            Color.black
            VStack(){
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 10)
                    .padding(.top)
                Spacer()
            }
        }.clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
