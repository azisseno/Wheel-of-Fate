//
//  Date.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 05/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func toFullString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
    
    func getWeekdaysDateWith(interval days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days % 5, to: self)!
    }
}
