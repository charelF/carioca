//
//  ContentView.swift
//  unote
//
//  Created by Charel Felten on 06/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = Game(playerCount: 3)
    
    var body: some View {
        TabView {
            
            CardCounterView(game: self.game, player: Player(name: "tmp") , round: Round(number: 1, win: -10, desc: "tmp"))
            .tabItem {
              Image(systemName: "suit.club")
              Text("Card Counter")
            }
            
            GameView(game: self.game)
            .tabItem {
              Image(systemName: "suit.spade")
              Text("Game")
            }
            
            VStack {
                Text("""
                    13 kaarten ausdeelen

                    -10 Paire Biller
                    -20 Paire Biller+ Paire Egal
                    -30 3 der selwechter
                    -40 FULLHOUSE 3mol di selwecht an 2mol diselwecht
                    -50 4 diselwecht
                    -60 40 punkten mat am mannsten karten
                    -70 suite vun 5, (5,10 net rausleen)
                    -80 2biller,3 selwecht , suite vun 3
                    -90 eng suite vun 5, 4 mol diselwescht
                    -100 alles beieneen kennen rausleen
                """)
                
                Text("Made by Charel Felten")
                .bold()
                .padding(10)
                
            }
            .tabItem {
              Image(systemName: "info.circle")
              Text("About")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
