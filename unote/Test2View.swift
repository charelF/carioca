//
//  Test2View.swift
//  unote
//
//  Created by Charel Felten on 15/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct Test2View: View {
    @ObservedObject var game: Game
    @State private var showPopover: Bool = false
    @State private var playerProposal = 0
    
    var body: some View {
        List {
            ForEach(self.game.rounds) { round in
                Group {
                    Section(header: Text("\(round.number): \(round.desc)")) {
                        ForEach(self.game.scoreBoard[round]!, id: \.self.id) { sbe in
                            Text("\(round.number) \(sbe.id)")
                            
                        }
                    }
                }
            }
        }
    }
}

struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View(game: Game(playerCount: 4))
    }
}


//struct SectionView: View {
//    @State var ri: Int
//    @ObservedObject var game: Game
//
//    var body: some View {
//        ForEach([0,1,2,3]/*Array(self.game.players.indices)*/, id: \.self) { pi in
//            HStack {
////                Text("\(self.game.players[pi])")
//                Text("R \(self.ri), P \(pi)")
//            }
//        }
//
//    }
//}

//.onTapGesture { self.showPopover = true }
//.popover(isPresented: self.$showPopover, arrowEdge: .bottom) {
//    CardCounterView(game: self.game, player_i: i, round_i: j)
//    Button(action: {
//        self.showPopover = false
//        self.game.reset(playerCount: self.playerProposal)
//    }) {
//        Text("Start")
//    }
//}


//ForEach(Array(self.game.rounds.enumerated()), id: \.element) { i in
//    Section(header: Text("\(i.element)")) {
//        ForEach(Array(self.game.players.enumerated()), id: \.element) { j in
//            Text("\(i.element) \(j.element)")
//        }
//    }
//}


