//
//  GlassViewModifier.swift
//  Drafts
//
//  Created by EO on 07/11/21.
//

import SwiftUI

struct GlassViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.thinMaterial)
            .padding()
    }
}

extension View {
    func glaced() -> some View {
        modifier(GlassViewModifier())
    }
}


