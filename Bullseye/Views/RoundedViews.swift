//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 12/02/26.
//

import SwiftUI

struct RoundedImageViewsStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}

struct RoundedImageViewsFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
            
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .frame(
                width: Constants.General.roundRectViewWidth,
                height: Constants.General.roundRectViewHeight
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCorderRadius)
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewLength
            )
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("LeaderboardRowColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}

struct PreviewView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewsFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewsStroked(systemName: "list.dash")
            RoundRectTextView(text: "999")
            RoundedTextView(text: "1")
        }
    }
}

#Preview {
    PreviewView()
}

#Preview {
    PreviewView().preferredColorScheme(.dark)
}
