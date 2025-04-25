//
//  BillNotification.swift
//  BillManager
//
//  Created by Samuel Bradshaw  on 4/22/25.
//  Copyright © 2025 Apple Inc. All rights reserved.
//

import Foundation

struct BillNotification {
    private var notificationID: String
    var date: Date
    
    init(notificationID: String? = nil, date: Date) {
        self.notificationID = notificationID ?? UUID().uuidString
        self.date = date
    }
}
