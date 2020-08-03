//
//  Test2View.swift
//  unote
//
//  Created by Charel Felten on 15/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct Test2View: View {
    @State private var blockAds = false
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [
//            Color(red: 251/256, green: 215/256, blue: 70/256),
//            Color(red: 250/256, green: 170/256, blue: 50/256)]),
//                       startPoint: .topLeading, endPoint: .bottom)
//
//
//            .edgesIgnoringSafeArea(.all)
        
            NavigationView {
                List {
                    Toggle(isOn: $blockAds) { Text("Block Ads in Safari") }
                }
                    .listStyle(GroupedListStyle())
                
            
            .navigationBarTitle("NanoBlock")
            }
        }
    }
}

struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View()
    }
}
