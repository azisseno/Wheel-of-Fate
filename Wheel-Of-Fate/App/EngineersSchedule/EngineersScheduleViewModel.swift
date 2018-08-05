//
//  EngineersScheduleViewModel.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import api

struct EngineersScheduleViewModel {
    
    var engineers: [Engineer] = []
    weak var dataSource: EngineersScheduleDataSource?
    
    //Rule: There are only two support shifts per day, a day shift and a night shift.
    private let shiftPerDay = 2
    private let daysToShow = 10
    private lazy var scheduleCount = shiftPerDay * daysToShow
    
    
    mutating func set(engineers: [Engineer]) {
        self.engineers = engineers
    }
    
    init(dataSource: EngineersScheduleDataSource) {
        self.dataSource = dataSource
    }
    
    func generateFate() {
        
// Uncomment to measure processing time
//      let start = DispatchTime.now() // <<<<<<<<<< Start time

        var result: [Schedule] = []
        var mutableEngineers = engineers
        var lastTwoDaysShift: [Engineer] = []
        var choosenEngineer: [UInt: Int] = [:]
        let currentDate = Date()
        var day: Int = 0
        var currentDay: Int = -1
        var minimalShift: Int = 0
        while !mutableEngineers.isEmpty {
            
            minimalShift = mutableEngineers.map { (choosenEngineer[$0.id] ?? 0) }.min()!
            let prioritizedEngineers = mutableEngineers.filter { engineer in
                return (choosenEngineer[engineer.id] ?? 0) == minimalShift
            }
            if let choosen = prioritizedEngineers.filter({ engineer in
                return !lastTwoDaysShift.contains(where: { $0 == engineer })
            }).randomElement() {
                let actualDay = day / 2
                if currentDay != actualDay {
                    let nextDay = actualDay + 1
                    let date = currentDate.getWeekdaysDateWith(interval: nextDay)
                    result.append(Schedule(date: date))
                    currentDay = actualDay
                }
                result.last?.engineers.append(choosen)
                day += 1
                choosenEngineer[choosen.id] = (choosenEngineer[choosen.id] ?? 0) + 1
                if choosenEngineer[choosen.id]! > 1 {
                    mutableEngineers.remove(choosen)
                }
                lastTwoDaysShift.append(choosen)
                lastTwoDaysShift = lastTwoDaysShift.take(last: 3) // shift skip
            }
            mutableEngineers = mutableEngineers.filter { engineer in
                return (choosenEngineer[engineer.id] ?? 0) < 2
            }
        }
        dataSource?.data.value = result
        
// Uncomment to measure processing time
//        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
//
//        print("Time to evaluate problem: \(timeInterval) seconds")

    }
}
