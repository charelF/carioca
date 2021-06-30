//
//  Test2View.swift
//  unote
//
//  Created by Charel Felten on 15/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID()
    var content: String
    init(_ content: String) {
        self.content = content
    }
}

//enum ReminderInterval: String {
//    case TwoHours = "2h"
//    case HalfADay = "12h"
//    case OneDay =  "24h"
//}

struct Test2View: View {
    @State var ri: Float = 4
    @State var nn: String = ""
    @State private var blockAds = false
    @State private var notes: [Note] = [Note("This is a note"), Note("Another note")]
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    var body: some View {
        EmptyView()
    }
}
//        NavigationView {
//            VStack {
//                List {
//                    Section(footer: Image(systemName: "checkmark")) {
//                        ForEach(self.notes) { note in
//                            Text(note.content)
//                        }
//                        .onDelete(perform: delete)
//                        .
//
////                        Text("New", text: $nn)
//                    }
                    
                    
                    
//                    Section(header: Text("Daily Reminder at")) {
//                        HStack {
//                            Text("\(Int(ri)):00")
//                            Slider(value: $ri, in: 0...24, step:1)
//                        }
//                    }
                    
//                    Section {
//                        Picker(selection: $ri, label: Text("What is your favorite color?")) {
//                            Text("Red").tag(0)
//                            Text("Green").tag(1)
//                            Text("Blue").tag(2)
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                    }
                    
//                    Section(footer: Text("All notes synced in iCloud")) {
//                        EmptyView()
//                    }
                    
//                }
//                .listStyle(GroupedListStyle())
//            Picker(selection: $reminderInterval, label: Text("What is your favorite color?")) {
//                Text("Red").tag(0)
//                Text("Green").tag(1)
//                Text("Blue").tag(2)
//            }
                
                
//            }
//            .navigationBarTitle(Text("Nanote").underline(), displayMode: .automatic)
//            .navigationBarItems(trailing:
//            Button(action: {
//                self.ri+=1
//            }, label: {
//                Image(systemName: "gear")
//            }))
//        }
//    }
//}

struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View()
    }
}
