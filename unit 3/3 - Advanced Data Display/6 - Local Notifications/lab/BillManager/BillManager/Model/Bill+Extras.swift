//
//  Bill+Extras.swift
//  BillManager
//

import Foundation
import UserNotifications

extension Bill {
    var hasReminder: Bool {
        return (remindDate != nil)
    }
    
    var isPaid: Bool {
        return (paidDate != nil)
    }
    
    var formattedDueDate: String {
        let dateString: String
        
        if let dueDate = self.dueDate {
            dateString = dueDate.formatted(date: .numeric, time: .omitted)
        } else {
            dateString = ""
        }
        
        return dateString
    }
    func removeReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationID])
    }
    
    mutating func schedule(date: Date, completion: @escaping (Bill) -> ()) {

        authorizeIfNeeded { (granted) in
            guard granted else {
                DispatchQueue.main.async {
                    completion(self)
                }
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Alarm"
            content.body = "beep beep"
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = Bill.notificationCategoryID
            
            let triggerDateComponents = Calendar.current.dateComponents([.minute, .hour, .day, .month, .year], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: self.notificationID, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) {
                (error: Error?) in DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }
    
    private func authorizeIfNeeded(completion: @escaping(Bool) -> ()){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound], completionHandler: {(granted, _) in completion(granted)
            })
            case .denied, .provisional, .ephemeral:
                completion(false)
            @unknown default:
                completion(false)
            }
        }

    }
    
    static let notificationCategoryID = "billNotification"
    
}
