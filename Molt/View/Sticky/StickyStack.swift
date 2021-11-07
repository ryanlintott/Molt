//
//  StickyStack.swift
//  Molt
//
//  Created by Ryan Lintott on 2021-11-07.
//

import SwiftUI

struct StickyStack: View {
    let colors: [(Int, Color)]
    let spacing: CGFloat
    let edge: Edge
    
    init(count: Int, spacing: CGFloat, edge: Edge) {
        colors = Color.stickyRainbow(count: count).enumerated().map { ($0, $1) }
        self.spacing = spacing
        self.edge = edge
    }
    
    var alignment: Alignment {
        switch edge {
        case .top:
            return Alignment(horizontal: .center, vertical: .top)
        case .leading:
            return Alignment(horizontal: .leading, vertical: .center)
        case .bottom:
            return Alignment(horizontal: .center, vertical: .bottom)
        case .trailing:
            return Alignment(horizontal: .trailing, vertical: .center)
        }
    }
    
    var isVertical: Bool {
        edge == .top || edge == .bottom
    }
    
    var aspectRatio: CGFloat {
        isVertical ? 1.5 : 1/1.5
    }
    
    var body: some View {
        ZStack(alignment: alignment) {
            ForEach(colors, id: \.0) { color in
                Diamond()
                    .fill(color.1)
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .alignmentGuide(alignment.vertical) { d in
                        switch edge {
                        case .top:
                            return d[alignment.vertical] - (spacing * CGFloat(color.0))
                        case .bottom:
                            return d[alignment.vertical] + (spacing * CGFloat(color.0))
                        default:
                            return d[alignment.vertical]
                        }
                    }
                    .alignmentGuide(alignment.horizontal) { d in
                        switch edge {
                        case .leading:
                            return d[alignment.horizontal] - (spacing * CGFloat(color.0))
                        case .trailing:
                            return d[alignment.horizontal] + (spacing * CGFloat(color.0))
                        default:
                            return d[alignment.horizontal]
                        }
                    }
            }
        }
    }
}

struct StickyStack_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var edge: Edge = .bottom
        @State private var count = 20
        
        var body: some View {
            VStack {
                Spacer()
                
                StickyStack(count: count, spacing: 20, edge: edge)
                
                Picker("Edge", selection: $edge) {
                    ForEach(Edge.allCases, id: \.self) { edge in
                        Text("\(edge.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
                
                Stepper("Count: \(count)", value: $count, in: 1...50)
                    .padding()
            }
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
