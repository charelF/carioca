//
//  PlayerView.swift
//  unote
//
//  Created by Charel Felten on 02/08/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var game: Game
    @State private var players: [Player] = []
    @State private var tmp: String = ""
    var save: ([Player]) -> Void
    
    var body: some View {
        VStack {
            List {
                
                TextField("Enter Name here", text: self.$tmp, onCommit: {
                    self.players.append(Player(name: self.tmp))
                    self.tmp = ""
                })
                
                Section(header: Text("Players: \(self.players.count)")) {
                
                    ForEach(self.players) { p in
                        Text(p.name)
                    }
                }
                
            }.listStyle(GroupedListStyle())
        
            HStack {
                Button(action: {self.players = []}, label: {Text("Reset").bold()})
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(5)
                
                Text("")
                    .padding(15)
                
                Button(action: {self.save(self.players)}, label: {Text("Save").bold()})
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(5)
            }.padding()
            
            Spacer()
        }
            
            
            
            
            
            
            
//            Text("\(self.game.players[player_i].name)")
//            Image(systemName: "arrow.right")
//            Spacer()
//            TextField("Enter Name here", text: self.$tmp)
//            Button(action: {
//                self.game.players[player_i].name = self.tmp
//                self.tmp = ""
//            }) {
//                Text("Save").foregroundColor(Color.blue)
//            }
    }
}



struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(game: Game(playerCount: 4), save: {_ in ()})
    }
}
