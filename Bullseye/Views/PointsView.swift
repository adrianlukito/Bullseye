//
//  PointsView.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 13/02/26.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(Int(sliderValue)))
            BodyText(text: "You scored \(game.points(sliderValue: Int(sliderValue))) Points\n 🎉🎉🎉")
            Button(
                action: {
                    game.restart()
                },
                label: {
                    ButtonText(text: "Start New Round")
                }
            )
        }
        .padding()
        .frame(maxWidth: 300)
        .background(
            Color("BackgroundColor")
        )
        .cornerRadius(12)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview {
    PointsView(sliderValue: .constant(50.0), game: .constant(Game()))
}

#Preview(traits: .landscapeRight) {
    PointsView(sliderValue: .constant(50.0), game: .constant(Game()))
        .preferredColorScheme(.dark)
}
