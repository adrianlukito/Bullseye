//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 16/02/26.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewsFilled(systemName: "xmark")
                }
            }
        }.padding([.horizontal, .top])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(text: String(score))
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color("LeaderboardRowColor"),
                    lineWidth: Constants.General.strokeWidth
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    LeaderboardView(leaderboardIsShowing: .constant(false), game: .constant(Game(loadTextData: true)))
}

#Preview(traits: .landscapeRight) {
    LeaderboardView(leaderboardIsShowing: .constant(false), game: .constant(Game(loadTextData: true)))
        .preferredColorScheme(.dark)
}
