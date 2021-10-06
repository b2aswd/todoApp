//
//  DateExtension.swift
//  ToDoApp
//
//  Created by Roman Manďák on 26.09.2021.
//

import Foundation

public extension Date {
    static var formatter = DateFormatter()
    static let defaultLocale = Locale(identifier: "en_US_POSIX")
    static var defaultDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

    static var defatultFormatter: DateFormatter {
        let dateStringFormatter = Self.formatter
        dateStringFormatter.dateFormat = defaultDateFormat
        dateStringFormatter.locale = defaultLocale
        return dateStringFormatter
    }

    init(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale = Date.defaultLocale) {
        let dateStringFormatter = Date.formatter
        dateStringFormatter.dateFormat = format
        dateStringFormatter.locale = locale
        let date = dateStringFormatter.date(from: dateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

    func getStringDate(_ format: String = defaultDateFormat, timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = Date.defaultLocale) -> String {
        let dateStringFormatter = Date.formatter
        dateStringFormatter.dateFormat = format
        dateStringFormatter.timeZone = timeZone
        dateStringFormatter.locale = locale
        return dateStringFormatter.string(from: self as Date)
    }

}
