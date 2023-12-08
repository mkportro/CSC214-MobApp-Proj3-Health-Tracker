//
//  NotificationsMgr.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import Foundation
import SwiftUI
import UserNotifications

class NotificationsMgr: ObservableObject {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if !success && error == nil {
                print("Notifications not permitted")
            }
        }
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if !success && error == nil {
                print("Notifications not permitted")
            }
        }
    }
    
    func scheduleNotification(title: String, note: String, date: Date) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = note
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "Health Tracker Notification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.add(request)
    }
}
