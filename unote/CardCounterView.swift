//
//  CardCounterView.swift
//  unote
//
//  Created by Charel Felten on 17/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct CardCounterView: View {
    @State var total = 0
    @ObservedObject var game: Game
    var player: Player
    var round: Round
    
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
                    self.game.enterScore(player: self.player, round: self.round, score: self.total)}, label: {Text("Save").bold()})
                    .foregroundColor(Color.green)
                    .padding(20)
                Button(action: {
                    self.game.enterScore(player: self.player, round: self.round, score: self.round.win)}, label: {Text("Won").bold()})
                    .foregroundColor(Color.yellow)
                    .padding(20)
            }
        }.foregroundColor(Color.primary)
    }
}

struct CardCounterView_Previews: PreviewProvider {
    static var previews: some View {
        CardCounterView()
    }
}
