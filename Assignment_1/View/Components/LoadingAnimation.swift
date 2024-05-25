//
//  LoadingAnimation.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 25/05/24.
//

import SwiftUI

struct LoadingHelixView: View {
    //    @State private var animate = false
    //
    //    var body: some View {
    //        GeometryReader { geometry in
    //            Canvas { context, size in
    //                let centerX = size.width / 2
    //                let centerY = size.height / 2
    //                let amplitude = size.width / 4
    //                let frequency = 0.5
    //                let dotRadius: CGFloat = 5.0
    //                let dotCount = 20
    //                let timeOffset = animate ? Double(dotCount) * 0.05 : 0
    //
    //                for i in 0..<dotCount {
    //                    let angle = Double(i) * .pi / Double(dotCount / 2) + timeOffset
    //                    let x = centerX + amplitude * cos(angle * frequency)
    //                    let y = centerY + amplitude * sin(angle * frequency)
    //
    //                    let color = Color(hue: Double(i) / Double(dotCount), saturation: 0.8, brightness: 0.9)
    //                    context.fill(
    //                        Circle()
    //                            .path(in: CGRect(x: x - dotRadius, y: y - dotRadius, width: dotRadius * 2, height: dotRadius * 2)),
    //                        with: .color(color)
    //                    )
    //                }
    //            }
    //            .frame(width: geometry.size.width, height: geometry.size.height)
    //        }
    //        .onAppear {
    //            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
    //                animate.toggle()
    //            }
    //        }
    //    }
    @State private var isAnimated = false
    var body: some View {
        HStack {
            Circle()
                .fill(Color.purple)
                .frame(width: 20, height: 20)
                .scaleEffect(isAnimated ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 0.5).repeatForever(), value: isAnimated)
            Circle()
                .fill(Color.orange)
                .frame(width: 20, height: 20)
                .scaleEffect(isAnimated ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.3), value: isAnimated)
            Circle()
                .fill(Color.purple)
                .frame(width: 20, height: 20)
                .scaleEffect(isAnimated ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.6), value: isAnimated)
        }
        .onAppear {
            isAnimated = true
        }
    }
    
}

#Preview {
    LoadingHelixView()
}
