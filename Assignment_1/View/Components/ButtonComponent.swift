//
//  ButtonComponent.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 25/05/24.
//

import SwiftUI

struct AnimatedButtonStyle: ButtonStyle {
    @State private var isHovered = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                ZStack {
                    if isHovered {
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(x: isHovered ? 0 : -UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.6), value: isHovered)
                    } else {
                        Color.purple
                            .clipShape(Capsule())
                    }
                }
            )
            .foregroundColor(.white)
            .cornerRadius(10)
            .onHover { hovering in
                isHovered = hovering
            }
            .animation(.easeInOut(duration: 0.6), value: isHovered)
    }
}
