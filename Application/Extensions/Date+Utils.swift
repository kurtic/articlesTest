//
//  Date+Utils.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

extension Date {
    var oneMonthAgo: Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(byAdding: .month, value: -1, to: self) ?? Date.now
    }
    
    var tommorow: Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(byAdding: .day, value: 1, to: self) ?? Date.now
    }
    
    var yesterday: Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(byAdding: .day, value: -1, to: self) ?? Date.now
    }
    
    var dayStart: Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.startOfDay(for: self)
    }
}
