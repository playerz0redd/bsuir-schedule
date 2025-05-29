//
//  Date+Ext.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 29.05.25.
//

import Foundation


extension Date {

    func getTime() -> String {
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    func currentDayOfWeek() -> Int {
        Calendar.current.component(.weekday, from: self)
    }
    
}
