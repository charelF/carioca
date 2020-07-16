//
//  Game.swift
//  unote
//
//  Created by Charel Felten on 12/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import Foundation

class Game: ObservableObject {
    
    @Published var playerCount: Int
    
    @Published var rounds: [String] = [
        "Royal pair",
        "Pair + Royal pair",
        "Three of a kind",
        "Full house",
        "Four of a kind",
        "40 Points with 4 cards",
        "Straight flush",
        "Pair + Three of a kind + Straight flush of 3 cards",
        "Straight flush + Four of a kind",
        "All cards"
    ]
    
    @Published var players: [String]
    
    @Published var scoreBoard: [[Int]]
    
    init(playerCount: Int) {
        self.playerCount = playerCount
        self.scoreBoard = [[Int]](repeating: [Int](repeating: 0, count: 10), count: playerCount)
        self.players = []
        for i in 1...playerCount {
            self.players.append("Player \(i)")
        }
    }
    
    func enterScore(player: Int, round: Int, score: Int) {
        self.scoreBoard[player][round] = score
    }
    
    func getScore(player: Int) -> Int {
        return self.scoreBoard[player].reduce(0, +)
    }
    
    // Workaround because creating a new game instance is not allowed with ObservableObject and inside struct
    func reset(playerCount: Int) {
        self.playerCount = playerCount
        self.scoreBoard = [[Int]](repeating: [Int](repeating: 0, count: 10), count: playerCount)
        self.players = []
        for i in 0..<playerCount {
            self.players.append("Player \(i)")
        }
    }
    
    func print() -> String {
        var out: String = ""
        for i in self.scoreBoard {
            for j in i {
                out += "\(j) |"
            }
            out += "\n"
        }
        return out
    }
}
