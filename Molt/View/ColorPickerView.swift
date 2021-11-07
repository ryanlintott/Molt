//
//  ColorPickerView.swift
//  Molt
//
//  Created by Prabaljit Walia on 08/11/21.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var chosenColor: StickyColor
    
    var body: some View {
        HStack{
            ForEach(StickyColor.allCases,id: \.self) { stickyColor in
                Button(action: {
                    chosenColor = stickyColor                        }) {
                        stickyColor.color
                            .aspectRatio(1,contentMode: .fit)
                            .clipShape(Circle())
                    }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
         ColorPickerView(chosenColor: Binding.constant(StickyColor.stickyYellow))
    }
}
