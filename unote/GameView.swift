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
//                ForEach([10,11,12,13,14,15,16,17,18,19] /*Array(self.game.rounds.enumerated())*/, id: \.self) { ri in
//                    Section(header: Text("Round \(ri-10): \(self.game.rounds[ri-10])")) {
//                        ForEach(Array(self.game.players.indices), id: \.self) { pi in
//                            HStack {
//                                Text("ri \(ri), pi \(pi)")
////                                NavigationLink(destination: CardCounterView(
////                                    game: self.game,
////                                    player_i: pi,
////                                    round_i: ri-10
////                                )) {
////                                    Text("\(self.game.scoreBoard[pi][ri-10])")
////                                        .frame(maxWidth: .infinity,
////                                               alignment: .trailing)
////                                }
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
                Text("ë")
            }
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
