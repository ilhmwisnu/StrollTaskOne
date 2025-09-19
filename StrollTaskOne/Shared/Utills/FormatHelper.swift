//
//  FormatHelper.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import Foundation

struct FormatHelper {
    private static let tz: TimeZone = .current

    private static let timeDF: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = tz
        df.dateFormat = "h:mm a"
        df.amSymbol = "am"
        df.pmSymbol = "pm"
        return df
    }()

    private static let weekdayDF: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = tz
        df.dateFormat = "EEE"  // e.g., Wed
        return df
    }()

    private static let shortDateDF: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = tz
        df.dateFormat = "d MMM"  // e.g., 9 Sep
        return df
    }()

    private static let shortDateYearDF: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = tz
        df.dateFormat = "d MMM yyyy"  // e.g., 9 Sep 2024
        return df
    }()

    static func formatDate(_ date: Date, now: Date = Date()) -> String {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = tz

        let startOfGiven = cal.startOfDay(for: date)
        let startOfNow = cal.startOfDay(for: now)
        let dayDelta =
            cal.dateComponents([.day], from: startOfGiven, to: startOfNow).day
            ?? 0

        if dayDelta == 0 {
            return timeDF.string(from: date)
        } else if (1...6).contains(dayDelta) {
            return weekdayDF.string(from: date).lowercased()
        } else {
            let sameYear =
                cal.component(.year, from: date)
                == cal.component(.year, from: now)
            return (sameYear ? shortDateDF : shortDateYearDF).string(from: date)
        }
    }

    static func secondsToString(_ seconds: Int) -> String {
        let total = max(0, seconds)
        let m = total / 60
        let s = total % 60
        return String(format: "%02d:%02d", m, s)
    }
}
