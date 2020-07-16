//
//  ListView.swift
//  unote
//
//  Created by Charel Felten on 13/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

//struct ListView: View {
//    @State var x = [1,2,3]
//
//    var body: some View {
//        VStack {
//            List(x, id: \.self) { i in
//                Text("\(i)")
//            }
//
//            Button(action: {self.x.append(5)}) {
//                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
//            }
//        }
//    }
//}

struct TestData: Identifiable {
    var id = UUID()
    var title: String
    var items: [String]
}

struct ListView : View {
//    @State var mygroups = [
//        TestData(title: "Numbers", items: ["1","2","3"]),
//        TestData(title: "Letters", items: ["A","B","C"]),
//        TestData(title: "Symbols", items: ["€","%","&"])
//    ]
    @State var mygroups = Game(playerCount: 4)
    
//    @State var mygroups = [
//        [1,2,3],
//        [2,3,4]
//    ]
    


//    var body: some View {
//        List {
//            ForEach(mygroups.scoreBoard.indices, id: \.self) { gr in
//                Section(header: Text("Player \(gr)")) {
//                    ForEach(self.mygroups.scoreBoard[gr], id: \.self) { item in
//                                Text("\(item)")
//                            }
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//    }
    
    var body: some View {
        List {
//            ForEach(self.mygroups.rounds.indices, id: \.self) { ri in
//                Section(header: Text("Round \(ri): \(self.mygroups.rounds[ri])")) {
//                    ForEach(self.mygroups.players.indices, id: \.self) { pi in
//                        Text("\(self.mygroups.scoreBoard[pi][ri])")
//                    }
//                }
//            }
            Text("e")
        }
        .listStyle(GroupedListStyle())
    }
    
//    var body: some View {
//        List {
//            ForEach(self.mygroups.rounds.indices, id: \.self) { i in
//                Section(header: Text("Round \(i): \(self.mygroups.rounds[i])")) {
//                    ForEach(self.mygroups.getPlayerScoreForRound(round: i), id: \.self) { j in
//                        Text("\(self.mygroups.scoreBoard[j][i])")
//                    }
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//    }
}



struct ListView_Previews: PreviewProvider {
  static var previews: some View {
     ListView()
  }
}
