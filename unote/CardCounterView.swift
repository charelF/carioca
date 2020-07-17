//
//  CardCounterView.swift
//  unote
//
//  Created by Charel Felten on 17/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

let cards = [
    Card(name:"2", value:2),
    Card(name:"3", value:3),
    Card(name:"4", value:4),
    Card(name:"5", value:5),
    Card(name:"6", value:6),
    Card(name:"7", value:7),
    Card(name:"8", value:8),
    Card(name:"9", value:9),
    Card(name:"10", value:10),
    Card(name:"J", value:11),
    Card(name:"Q", value:11),
    Card(name:"K", value:11),
    Card(name:"A", value:11),
    Card(name:"Joker", value:25)
]

struct CardCounterView: View {
    @State var total = 0
    @State var sum: String = ""
    @ObservedObject var game: Game
    var player: Player
    var round: Round
    
    func add(card: Card) {
        self.total += card.value
        if self.sum == "" {
            self.sum += "\(card.name) "
        } else {
            self.sum += "+ \(card.name) "
        }
    }
    
    func reset() {
        self.total = 0
        self.sum = ""
    }
    
    func win() {
        self.total = self.round.win
        self.sum = "Won"
    }
    
    func save() {
        self.game.enterScore(player: self.player, round: self.round, score: self.total)
    }
    
    var body: some View {
        VStack {

            Text(String(total))
            .bold()
            .padding(20)
            .background(Color.purple)
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            .font(.title)
            .contextMenu {
                Text(self.sum)
            }
            .shadow(color: Color.purple, radius: 40, y: 0)

            VStack {
                HStack {
                    ForEach([0,1,2], id: \.self) { i in
                        Button(action: {self.add(card: cards[i])}, label: {Text(cards[i].name)})
                        .padding(20)
                    }
                }

                HStack {
                    ForEach([3,4,5], id: \.self) { i in
                        Button(action: {self.add(card: cards[i])}, label: {Text(cards[i].name)})
                        .padding(20)
                    }
                }

                HStack {
                    ForEach([6,7,8], id: \.self) { i in
                        Button(action: {self.add(card: cards[i])}, label: {Text(cards[i].name)})
                        .padding(20)
                    }
                }
                
                HStack {
                    ForEach([9,10,11], id: \.self) { i in
                        Button(action: {self.add(card: cards[i])}, label: {Text(cards[i].name)})
                        .padding(20)
                    }
                }
                
                HStack {
                    ForEach([12,13], id: \.self) { i in
                        Button(action: {self.add(card: cards[i])}, label: {Text(cards[i].name)})
                        .padding(20)
                    }
                    
                    Button(action: {self.win()}, label: {Text("Won").bold()})
                    .padding(20)
                    .foregroundColor(Color.yellow)
                }
            }
            .padding(30)

            HStack {
                Button(action: {self.reset()}, label: {Text("Reset").bold()})
                    .foregroundColor(Color.red)
                    .padding(20)
                Button(action: {self.save()}, label: {Text("Save").bold()})
                    .foregroundColor(Color.green)
                    .padding(20)
            }
            
//            Text(self.sum)
//                .font(.footnote)
//                .foregroundColor(Color.gray)
        }.foregroundColor(Color.primary)
    }
}

struct CardCounterView_Previews: PreviewProvider {
    static var previews: some View {
        CardCounterView(game: Game(playerCount: 4),
                        player: Player(name: "tmp"),
                        round: Round(number: 1, win: -10, desc: "tmp"))
    }
}
