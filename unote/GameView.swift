//
//  GameView.swift
//  unote
//
//  Created by Charel Felten on 08/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: Game
    @State private var showPopover: Bool = false
    @State private var playerProposal = 0
    
    var body: some View {
        NavigationView {
            List {
                
                HStack {
                    Text("Player").bold()
                    Spacer()
                    Text("Score").bold()
                }
                
                ForEach(self.game.rounds) { round in
                    Group {
                        Section(header: Text("\(round.number): \(round.desc)")) {
                            ForEach(self.game.scoreBoard[round]!, id: \.self.id) { sbe in
                                HStack {
                                    Text("\(sbe.player.name)")
                                    Spacer()
                                    NavigationLink(destination: CardCounterView(
                                        game: self.game,
                                        player: sbe.player,
                                        round: sbe.round
                                    )) {
                                        Text("\(self.game.getScore(player: sbe.player, round: sbe.round))")
                                            .frame(maxWidth: .infinity,
                                                   alignment: .trailing)
                                    }
//
                                }
                            }
                        }
                    }
                }
                Section(header: Text("Total").underline()) {
                    ForEach(Array(self.game.players), id: \.self) { player in
                        HStack {
                            Text("\(player.name)").bold()
                            Spacer()
                            Text("\(self.game.getTotalScore(player: player))").bold()
                        }
                    }
                }
            }
//            List {
//                ForEach(self.game.rounds) { round in
//                    Group {
//                        Section(header: Text("Round \(round.number): \(round.desc)")) {
//                            ForEach(self.game.scoreBoard[round]!, id: \.self.id) { sbe in
//                                HStack {
//                                    Text("\(sbe.player.name)")
//                                    NavigationLink(destination: CardCounterView(
//                                        game: self.game,
//                                        player: sbe.player,
//                                        round: sbe.round
//                                    )) {
//                                        Text("\(self.game.getScore(player: sbe.player, round: sbe.round))")
//                                            .frame(maxWidth: .infinity,
//                                                   alignment: .trailing)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                Section(header: Text("Total")) {
//                    ForEach(Array(self.game.players.indices), id: \.self) { pi in
//                        HStack {
//                            Text("\(self.game.players[pi]):")
//                            Spacer()
//                            Text("\(self.game.getScore(player: pi))")
//                        }
//                    }
//                }
//                Text("ë")
//            }
            .listStyle(GroupedListStyle())
                    
            .navigationBarTitle("Game")
            .navigationBarItems(leading:
                Button(action: {self.showPopover = true}) {
                    Text("New Game")
                }
                .popover(isPresented: self.$showPopover, arrowEdge: .bottom) {
                    Text("Select amount of players")
                    Picker(selection: self.$playerProposal, label: Text("")) {
                        ForEach(0..<10) { i in
                            Text("\(i)")
                        }
                    }.labelsHidden()
                    Button(action: {
                        self.showPopover = false
                        self.game.reset(playerCount: self.playerProposal)
                    }) {
                        Text("Start")
                    }
                }
            )
        }
    }
}
            
            

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Game(playerCount: 4))
    }
}
