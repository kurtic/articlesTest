//
//  DateFormatter+Utils.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

extension DateFormatter {
    public static var iso8601: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)!
        return formatter
    }
    
    public static var shortDateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)!
        return formatter
    }
}
