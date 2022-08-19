//
//  AXGrowingButton.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-17.
//

import SwiftUI

struct AXGrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
