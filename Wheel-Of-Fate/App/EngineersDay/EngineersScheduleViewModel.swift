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
    
    private var engineersMap: [Engineer: Int] = [:]
    private var result: [Schedule] = []
    
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
    
    mutating func generateFate() {
        engineersMap = [:]
        var schedules: [Schedule] = []
        let currentDate = Date()
        var counter = 0
        while schedules.count < daysToShow {
            let date = Calendar.current.date(byAdding: .day, value: counter, to: currentDate)!
            counter += 1
            if [1, 7].contains(date.dayNumberOfWeek()!) {
                continue
            }
            schedules.append(Schedule(date: date))
        }
        
        while (engineersMap.values.count == 0 || engineersMap.values.contains { $0 != 2 }) {
            
            // reset if not found
            schedules.forEach { $0.engineers = [] }
            result = []
            engineersMap = [:]
            
            for schedule in schedules {
                var currentShifts: [Engineer] = []
                for _ in 0..<shiftPerDay {
                    if let engineer = pickAndValidate(currentShifts) {
                        schedule.add(engineer: engineer)
                        currentShifts.append(engineer)
                    } else {
                        // not found solution
                        break
                    }
                }
                
                if schedule.engineers.count < 2 {
                    break
                }
                result.append(schedule)
            }
        }
        for s in result {
            print("\(s.date.toFullString()) -> ")
            for e in s.engineers {
                print(e.name)
            }
            print("")
        }
        dataSource?.data.value = result
    }
    
    private mutating func pickAndValidate(_ currentShifts: [Engineer]) -> Engineer? {
        var invalidEngineers: Set<Engineer> = []
        while invalidEngineers.count < engineers.count {
            let engineer = getRandom()
            
            //Rule: Each engineer should have completed 2 shifts of support in any 2 week period
            if let count = engineersMap[engineer],
                count == 2 {
                invalidEngineers.insert(engineer)
                continue
            }
            
            //Rule: An engineer can do at most one shift in a day
            if currentShifts.contains(engineer) {
                invalidEngineers.insert(engineer)
                continue
            }
            
            //Rule: An engineer cannot have more than one shift on any consecutive days
            if let schedule = result.last,
                schedule.engineers.contains(engineer) {
                invalidEngineers.insert(engineer)
                continue
            }
            
            if let count = engineersMap[engineer] {
                engineersMap[engineer] = count + 1
            } else {
                engineersMap[engineer] = 1
            }
            return engineer
        }
        return nil
    }
    
    private func getRandom() -> Engineer {
        let idx = randomNumber(min: 0, max: engineers.count)
        return engineers[idx]
    }
}
