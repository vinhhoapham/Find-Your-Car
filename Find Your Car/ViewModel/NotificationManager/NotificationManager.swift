//
//  NotificationManager.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/15/22.
//

import Foundation
import UserNotifications
import SwiftUI

enum NotificationDefault {
    static let content = UNMutableNotificationContent()
}


class NotificationManager : NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    var center = UNUserNotificationCenter.current()
    var authorization : NotificationAuthorization
    override init() {
        authorization = NotificationAuthorization(center: center)
        authorization.requestAuthorization()
        NotificationDefault.content.title = "Let's get your car"
    }
    
    
    func createReqeust(time: Date, content: UNNotificationContent)-> UNNotificationRequest {
        let uniqueIdentifier = UUID().uuidString
        let content = content
        let trigger = createTrigger(time: time)
        let request = UNNotificationRequest(
            identifier: uniqueIdentifier,
            content: content,
            trigger: trigger)
        
        return request
        
    }
    
    func scheduleANotification(time: Date, message: String, title: String) {
        let notificationContent = generateNotificationContent(title: title, message: message)
        scheduleANotification(time: time, content: notificationContent)
        
    }
    
    func createTrigger(time: Date) -> UNCalendarNotificationTrigger {
        let triggeringTime = Calendar.current.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggeringTime, repeats: false)
        return trigger
    }
    
    func scheduleANotification(time: Date, content: UNNotificationContent){
        let notificationRequest = createReqeust(time: time, content: content)
        center.add(notificationRequest) { error in
            if error != nil {
                // MARK: Make this something usesful
                print(error!)
            }
        }
    }
    
    func generateNotificationContent(
            title: String,
            message: String
        ) -> UNMutableNotificationContent {
            
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = message
            
            return content
            
    }
    
    
    
    
}


