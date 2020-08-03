//
//  CardGame.swift
//  unote
//
//  Created by Charel Felten on 24/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

//import Foundation
//
//enum Suit: String, CaseIterable {
//    case heart = "♥️"
//    case diamond = "♦️"
//    case pike = "♠️"
//    case club = "♣️"
//    case joker = "🃏"
//}
//
//enum Rank: String, CaseIterable {
//    case ace = "A"
//    case two = "2"
//    case three = "3"
//    case four = "4"
//    case five = "5"
//    case six = "6"
//    case seven = "7"
//    case eight = "8"
//    case nine = "9"
//    case ten = "10"
//    case jack = "J"
//    case queen = "Q"
//    case king = "K"
//    case joker = "JKR"
//}
//
//struct Card: Equatable {
//    let rank: Rank
//    let suit: Suit
//    let name: String
//        
//    init(_ rank: Rank, _ suit: Suit) {
//        self.rank = rank
//        self.suit = suit
//        self.name = rank.rawValue + suit.rawValue
//    }
//}

//class CardSet {
//    var cards: [Card]
//
//    init(jokers: Int, sets: Int = 1) {
//        self.cards = []
//        for _ in 0..<sets {
//            for r in Rank.allCases {
//                for s in Suit.allCases {
//                    if (s != .joker && r != .joker) {
//                        cards.append(Card(r, s))
//                    }
//                }
//            }
//        }
//        cards.append(contentsOf: Array(repeating: Card(.joker, .joker), count: jokers))
//    }
//
//    func shuffle() {
//        self.cards.shuffle()
//        self.pile.shuffle()
//    }
//
//    func pick() -> Card? {
//        if !self.cards.isEmpty {
//            return self.cards.removeFirst()
//        } else {
//            self.shuffle()
//            if !self.pile.isEmpty {
//                return self.pile.removeFirst()
//            } else {
//                return nil
//            }
//        }
//    }
//
//    func put(card: Card) {
//        self.pile.append(card)
//    }
//}
//
//
//
//var x = CardSet(jokers: 52, sets: 9)
//for i in x.cards {
//    print(i.name)
//}
//
//var i = [1]
//i.removeFirst()
//i.removeFirst()
