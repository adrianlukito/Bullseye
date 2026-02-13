//
//  Game.swift
//  Bullseye
//
//  Created by Adrian Lukito Lo on 08/02/26.
//

import Foundation

struct Game {
    var target = Int.random(in: 1..<100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var points = 100 - difference
        if points == 100 {
            points += 100
        } else if difference <= 2 {
            points += 50
        }
        return points
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1..<100)
    }
    
    mutating func restart() {
        target = Int.random(in: 1..<100)
        score = 0
        round = 1
    }
}
