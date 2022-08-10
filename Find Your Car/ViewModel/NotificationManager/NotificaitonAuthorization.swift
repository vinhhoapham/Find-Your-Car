//
//  File.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/18/22.
//

import Foundation
import UserNotifications
import SwiftUI

/// Handling authorization of notification
class NotificationAuthorization {
    
    var center              : UNUserNotificationCenter
    var notificationSettings : UNNotificationSettings?
    init (center : UNUserNotificationCenter) {
        self.center = center
    }
    
    func updateAuthorizationSettings() {
        center.getNotificationSettings { settings in
            self.notificationSettings = settings
        }
    }
    
    func checkNotificationStatus() {
        guard let notifcationSettings = notificationSettings else {
            return
        }
        if notifcationSettings.authorizationStatus == .denied {
            requestAuthorization()
        }
    }
    
    
    func requestAuthorization() {
        center.requestAuthorization(options: [.alert, .sound, .badge, .provisional]) { [unowned self] granted, error in
            
            if let error = error {
                // MARK: Fix this to something more useful
                print(error)
            }
            
            self.updateAuthorizationSettings()
        }
    }
    
    // MARK: Add listener's to user change aka UNNotification delegate
    
}
