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

struct PreviewView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewsFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewsStroked(systemName: "list.dash")
        }
    }
}

#Preview {
    PreviewView()
}

#Preview {
    PreviewView().preferredColorScheme(.dark)
}
