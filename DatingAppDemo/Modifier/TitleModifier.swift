//
//  TitleModifier.swift
//  DatingAppDemo
//
//  Created by Raghav Sethi on 14/10/20.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}

