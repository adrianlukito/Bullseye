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
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: 2
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
            .frame(width: 56, height: 56)
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
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: 2
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
        }
    }
}

#Preview {
    PreviewView()
}

#Preview {
    PreviewView().preferredColorScheme(.dark)
}
