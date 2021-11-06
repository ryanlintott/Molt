//
//  SessionStartView.swift
//  Molt
//
//  Created by Prabaljit Walia on 06/11/21.
//

import SwiftUI

struct SessionStartView: View {
    @Binding var hours:Int
    @Binding var minutes:Int
    var body: some View {
        Text("\(hours)+\(minutes)")
    }
}

//struct SessionStartView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionStartView(hours: <#Binding<Int>#>, minutes: <#Binding<Int>#>)
//    }
//}
