//
//  Game.swift
//  unote
//
//  Created by Charel Felten on 12/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import Foundation

struct Card {
    var name: String
    var value: Int
}

struct Round: Hashable, Identifiable {
    var number: Int
    var win: Int
    var desc: String
    var id: UUID = UUID()
}
    
struct Player: Hashable, Identifiable, Equatable {
    var name: String
    var id: UUID = UUID()
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ScoreBoardEntry: Identifiable {
    var id = UUID()
    var value: Int
    var round: Round
    var player: Player
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
    @Published var scoreBoard: [Round:[ScoreBoardEntry]]
    
    init(players: [Player]) {
        self.scoreBoard = [:]
        self.players = players
        self.playerCount = players.count
        
        for r in self.rounds {
            var tmp: [ScoreBoardEntry] = []
            for p in self.players {
                tmp.append(ScoreBoardEntry(value: 0, round: r, player: p))
            }
            self.scoreBoard[r] = tmp
        }
    }
    
    convenience init(playerCount: Int) {
        var tmp = [Player]()
        for i in 0..<playerCount {
            tmp.append(Player(name:"Player \(i+1)"))
        }
        self.init(players: tmp)
    }
    
    func getScore(player: Player, round: Round) -> Int {
        var out: Int = 0
        for sbe in self.scoreBoard[round]! {
            if sbe.player.id == player.id {
                out += sbe.value
            }
        }
        return out
    }
    
    func enterScore(player: Player, round: Round, score: Int) {
        if let sbe_a = self.scoreBoard[round] {
            for (i, sbe) in sbe_a.enumerated() {
                if sbe.player == player {
                    self.scoreBoard[round]![i] = ScoreBoardEntry(value: score, round: round, player: player)
                }
            }
        }
    }
    
    func getTotalScore(player: Player) -> Int {
        var tmp: [Int] = []
        for r in self.rounds {
            tmp.append(self.getScore(player: player, round: r))
        }
        return tmp.reduce(0, +)
    }
    
    // Workaround because creating a new game instance is not allowed with ObservableObject and inside struct
    func reset(players: [Player]) {
        self.scoreBoard = [:]
        self.players = players
        self.playerCount = players.count
        
        for r in self.rounds {
            var tmp: [ScoreBoardEntry] = []
            for p in self.players {
                tmp.append(ScoreBoardEntry(value: 0, round: r, player: p))
            }
            self.scoreBoard[r] = tmp
        }
    }
}
