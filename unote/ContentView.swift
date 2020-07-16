//
//  ContentView.swift
//  unote
//
//  Created by Charel Felten on 06/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = Game(playerCount: 4)
    
    var body: some View {
        TabView {
            
            CardCounterView(game: self.game, player_i: 0, round_i: 0)
            .tabItem {
              Image(systemName: "suit.club")
              Text("Card Counter")
            }
            
            GameView(game: self.game)
            .tabItem {
              Image(systemName: "suit.spade")
              Text("Game")
            }
            
            Test2View(game: self.game)
            .tabItem {
              Image(systemName: "info.circle.fill")
              Text("Info2")
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
                
                TestView(game: self.game)
                
            }
            .tabItem {
              Image(systemName: "info.circle")
              Text("About")
            }
        }
    }
}

struct CardCounterView: View {
    @State var total = 0
    @ObservedObject var game: Game
    var player_i: Int
    var round_i: Int
    
    var body: some View {
        VStack {
            
            Text(String(total))
            .bold()
            .padding(20)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .topTrailing)
            )
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            .font(.title)
            .contextMenu {
                Text(String(total))
            }
                
                
            
            
            
            VStack {
                HStack {
                    Button(action: {self.total += 2}, label: {Text("2")})
                    .padding(20)
                    
                    Button(action: {self.total += 3}, label: {Text("3")})
                    .padding(20)
                    
                    Button(action: {self.total += 4}, label: {Text("4")})
                    .padding(20)
                    
                }
                
                HStack {
                    
                    Button(action: {self.total += 5}, label: {Text("5")})
                    .padding(20)
                    
                    Button(action: {self.total += 6}, label: {Text("6")})
                    .padding(20)
                    
                    Button(action: {self.total += 7}, label: {Text("7")})
                    .padding(20)
                    
                }
                    
                HStack {
                    
                    Button(action: {self.total += 8}, label: {Text("8")})
                    .padding(20)
                
                    Button(action: {self.total += 9}, label: {Text("9")})
                    .padding(20)
                    
                    Button(action: {self.total += 10}, label: {Text("10")})
                    .padding(20)
                    
                    
                }
                HStack {
                    
                    Button(action: {self.total += 11}, label: {Text("J")})
                    .padding(20)
                    
                    Button(action: {self.total += 11}, label: {Text("Q")})
                    .padding(20)
                
                    Button(action: {self.total += 11}, label: {Text("K")})
                    .padding(20)
                    
                }
                HStack {
                    
                    Button(action: {self.total += 11}, label: {Text("A")})
                    .padding(20)
                    
                    Button(action: {self.total += 25}, label: {Text("Joker")})
                    .padding(20)
                }
            }
            .padding(30)
            
            HStack {
                Button(action: {self.total=0}, label: {Text("Reset").bold()})
                    .foregroundColor(Color.red)
                    .padding(20)
                Button(action: {
                    self.game.enterScore(player: self.player_i, round: self.round_i, score: self.total)}, label: {Text("Save").bold()})
                    .foregroundColor(Color.green)
                    .padding(20)
                Button(action: {
                    let win = -10*(self.round_i+1)
                    self.total = win
                    self.game.enterScore(player: self.player_i, round: self.round_i, score: win )}, label: {Text("Won").bold()})
                .foregroundColor(Color.yellow)
                .padding(20)

            }
            }.foregroundColor(Color.primary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
