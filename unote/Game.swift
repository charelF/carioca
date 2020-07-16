//
//  Game.swift
//  unote
//
//  Created by Charel Felten on 12/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import Foundation

struct Round {
    var number: Int
    var win: Int
    var desc: String
    var id: UUID = UUID()
}

struct Player: Hashable {
    var name: String
    var id: UUID = UUID()
}


class Game: ObservableObject {
    
    @Published var playerCount: Int
    
    @Published var rounds: [Round] = [
        Round(number: 1, win: -10, desc: "Royal pair"),
        Round(number: 2, win: -20, desc: "Pair + Royal pair"),
        Round(number: 3, win: -30, desc: "Three of a kind"),
        Round(number: 4, win: -40, desc: "Full house"),
        Round(number: 5, win: -50, desc: "Four of a kind"),
        Round(number: 6, win: -60, desc: "40 Points with 4 cards"),
        Round(number: 7, win: -70, desc: "Straight flush"),
        Round(number: 8, win: -80, desc: "Pair + Three of a kind + Straight flush of 3 cards"),
        Round(number: 9, win: -90, desc: "Straight flush + Four of a kind"),
        Round(number: 10, win: -100, desc: "All cards")
    ]
    
    @Published var players: [Player]
    
    @Published var scoreBoard: [Player:[Int]]
    
    
    init(playerCount: Int) {
        self.scoreBoard = [:]
        self.players = []
        self.playerCount = playerCount
        
        // generate players
        for i in 0..<playerCount {
            self.players.append(Player(name:"Player \(i+1)"))
        }
        
        // generate scoreboard
        for p in self.players {
            self.scoreBoard[p] = [Int](repeating: 0, count: 10)
        }
    }
    
    func getScore(player: Player, round: Round) -> Int {
        return self.scoreBoard[player]![round.number-1]
    }
    
    func enterScore(player: Player, round: Round, score: Int) {
        self.scoreBoard[player]![round.number-1] = score
    }
    
    func getTotalScore(player: Player) -> Int {
        return self.scoreBoard[player]!.reduce(0, +)
    }
    
    // Workaround because creating a new game instance is not allowed with ObservableObject and inside struct
    func reset(playerCount: Int) {
        self.scoreBoard = [:]
        self.players = []
        self.playerCount = playerCount
        
        // generate players
        for i in 0..<playerCount {
            self.players.append(Player(name:"Player \(i+1)"))
        }
        
        // generate scoreboard
        for p in self.players {
            self.scoreBoard[p] = [Int](repeating: 0, count: 10)
        }
    }
    
    func print() -> String {
        var out: String = ""
//        for i in self.scoreBoard {
//            for j in i {
//                out += "\(j) |"
//            }
//            out += "\n"
//        }
        return out
    }
}
