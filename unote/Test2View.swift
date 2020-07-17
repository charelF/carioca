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
