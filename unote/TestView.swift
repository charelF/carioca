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
        Text("test")
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(game: Game(playerCount: 3))
    }
}
