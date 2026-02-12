//
//  ContentView.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 06/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
            Text("89")
                .font(.largeTitle)
                .kerning(-1.0)
                .fontWeight(.black)
            HStack{
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                alertIsVisible = true
            }
            .alert(
                "Hello there!",
                isPresented: $alertIsVisible,
                actions: {
                    Button("Awesome") {
                        print("Alert closed")
                    }
                },
                message: {
                    var roundedValue: Int = Int(sliderValue.rounded())
                    Text("The slider's value is \(roundedValue)")
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
