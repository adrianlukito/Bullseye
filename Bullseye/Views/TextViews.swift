//
//  TextViews.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 12/02/26.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .kerning(-1.0)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.footnote)
            .bold()
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

#Preview {
    VStack {
        InstructionText(text: "Instructions")
        BigNumberText(text: "999")
        SliderLabelText(text: "100")
        LabelText(text: "Round")
        BodyText(text: "You scored 200 Points\n 🎉🎉🎉")
        ButtonText(text: "Start New Round")
        ScoreText(text: "10")
        DateText(date: Date())
        BigBoldText(text: "Leaderboard")
    }.padding()
}
