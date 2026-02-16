//
//  ContentView.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 06/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
       
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(
                        alertIsVisible: $alertIsVisible,
                        sliderValue: $sliderValue,
                        game: $game
                    )
                } else {
                    HitMeButton(
                        alertIsVisible: $alertIsVisible,
                        sliderValue: $sliderValue,
                        game: $game
                    )
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
            }
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack{
            SliderLabelText(text: "1")
                .frame(width: 35)
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button("Hit Me".uppercased()) {
            alertIsVisible = true
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom
                )
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .bold()
        .font(.title3)
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}

