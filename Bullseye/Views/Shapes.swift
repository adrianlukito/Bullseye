//
//  Shapes.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 12/02/26.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShape = true
    var body: some View {
        VStack {
            if !wideShape {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.slide)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: wideShape ? 200 : 100, height: 100)
//                .animation(.easeInOut, value: wideShape)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShape ? 200 : 100, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShape ? 200 : 100, height: 100)
            Button("Animate!") {
                withAnimation{
                    wideShape.toggle()
                }
            }
        }
    }
}

#Preview {
    Shapes()
}
