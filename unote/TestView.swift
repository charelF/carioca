//
//  TestView.swift
//  unote
//
//  Created by Charel Felten on 13/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI
import Combine


struct TestView: View {
    @ObservedObject var game: Game
    @State var t = "Debug"
    
    var body: some View {
        Button(action: {self.t = self.game.print()}) {
            Text(t)
                .font(.footnote)
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(game: Game(playerCount: 3))
    }
}


//var body: some View {
//    NavigationView {
//        VStack {
//            List {
//                ForEach(self.game.rounds.indices, id: \.self) { ri in
//                    Section(header: Text("Round \(ri): \(self.game.rounds[ri])")) {
//                        ForEach(self.game.players.indices, id: \.self) { pi in
//                            HStack {
//                                Text("\(pi) \(ri)")
//                                Text("\(self.game.players[pi])")
//                                NavigationLink(destination: CardCounterView(
//                                    game: self.game,
//                                    player_i: pi,
//                                    round_i: ri
//                                )) {
//                                    Text("e")
//                                    Text("\(self.game.scoreBoard[pi][ri])")
//                                        .frame(maxWidth: .infinity,
//                                               alignment: .trailing)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
