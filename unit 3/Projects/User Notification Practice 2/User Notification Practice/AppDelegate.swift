//
//  AppDelegate.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/15/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let remindMeLaterAction = UNNotificationAction(identifier: "remindMeLater", title: "Remind Me Later", options: [])
        let newEntryAction = UNTextInputNotificationAction(identifier: "newEntry", title: "New Entry", textInputButtonTitle: "Enter", textInputPlaceholder: "Being writing...")
        
        let journalReminderCategory = UNNotificationCategory(identifier: "journalReminderCategory", actions: [remindMeLaterAction, newEntryAction], intentIdentifiers: [], options: [])
        
        let center = UNUserNotificationCenter.current()
        center.setNotificationCategories([journalReminderCategory])
        center.delegate = self
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "remindMeLater":
            self.scheduleNotification()
        case "newEntry":
            if let textInputResponse = response as? UNTextInputNotificationResponse {
                let text = textInputResponse.userText
                let journalEntry = JournalEntry(text: text)
                
                ListTableViewController.journalEntries.append(journalEntry)
                ListTableViewController.journalEntries.sort { $0.date > $1.date }
                
                NotificationCenter.default.post(name: NSNotification.Name("reloadTableView"), object: nil)
            }
        default:
            NotificationCenter.default.post(name: NSNotification.Name("UserDidTapNotification"), object: nil)
        }
        
        completionHandler()
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.title = "Journal Reminder"
        content.body = "Don't forget to journal today!"
        content.categoryIdentifier = "journalReminderCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "journalRemind", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}

