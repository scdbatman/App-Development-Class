//
//  SettingsViewController.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/21/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var reminderToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Settings"
        
        reminderToggle.isOn = UserDefaults.standard.bool(forKey: "reminderEnabled")
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func reminderToggleValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if let error = error {
                    print("Error requesting authorization: \(error)")
                    sender.isOn = false
                    UserDefaults.standard.set(false, forKey: "reminderEnabled")
                } else if granted {
                    print("Notification authorization granted!")
                    // Schedule a notification
                    self.scheduleNotification()
                    
                    UserDefaults.standard.set(true, forKey: "reminderEnabled")
                } else {
                    print("Notification authorization not granted.")
                    sender.isOn = false
                    UserDefaults.standard.set(false, forKey: "reminderEnabled")
                }
            }
        }
        
        UserDefaults.standard.set(reminderToggle.isOn, forKey: "reminderEnabled")
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
