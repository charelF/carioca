//
//  TestView.swift
//  unote
//
//  Created by Charel Felten on 13/07/2020.
//  Copyright © 2020 Charel Felten. All rights reserved.
//

import SwiftUI
import Combine
import UserNotifications
import AVFoundation

struct TestView: View {
    
    @State private var test = "test"
    
    let pub = NotificationCenter.default.publisher(for: UIDevice.batteryLevelDidChangeNotification)
    
    func textToSpeech(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func addNotification(for s: String) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Battery @ \(UIDevice.current.batteryLevel)"
            content.subtitle = s
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 12
            dateComponents.minute = 5
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*2, repeats: true)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
        
        self.test = "done"
    }
    
    

    
    var body: some View {
        
        VStack {
            
            //            ForEach<Range<Int>, Int, Any>(
            
            Text("battery: \(UIDevice.current.batteryLevel)")
//                .onReceive(pub) { _ in
//                    print("User took a screenshot!")
//                }
            
//            Button("\(self.test)") {
//                self.addNotification(for: "e")
//            }
//
//            Button("\(self.test)") {
//                self.textToSpeech(text: "Battery @ \(Int(UIDevice.current.batteryLevel*100))")
//            }
            
//            Text("Hello, World!")
//            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
//                print("User took a screenshot!")
//            }
        }
        
        
        
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
