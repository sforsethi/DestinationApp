//
//  ButtonModifier.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 14/10/20.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
            .background(Capsule().fill(Color.pink))
            .foregroundColor(Color.white)
    }
}

