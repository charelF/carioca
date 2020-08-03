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
    @State private var showPopoverNG: Bool = false
    @State private var playerProposal = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.game.rounds) { round in
                    Group {
                        Section(header:
                            HStack {
                                Text("Round \(round.number): \(round.desc)")
                                Spacer()
                                Text("Score")
                            }
                        ) {
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
            .listStyle(GroupedListStyle())
                    
            .navigationBarTitle("Game")
            .navigationBarItems(trailing:
                Button(action: {self.showPopoverNG = true}) {
                    Text("New Game")
                }
                .popover(isPresented: self.$showPopoverNG) {
                    PlayerView(game: self.game, save: { players in
                        self.game.reset(players: players)
                        self.showPopoverNG = false
                    })
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
