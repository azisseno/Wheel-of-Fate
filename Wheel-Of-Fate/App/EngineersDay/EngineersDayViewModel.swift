//
//  EngineersDayViewModel.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import api

struct EngineersDayViewModel {
    
    var engineers: [Engineer] = []
    weak var dataSource: EngineersDayDataSource?
    
    mutating func set(engineers: [Engineer]) {
        self.engineers = engineers
    }

    init(dataSource: EngineersDayDataSource) {
        self.dataSource = dataSource
    }
    
    func generateFate() {
        
        //  INI CONTOH DOANG BUAT KEPERLUAN TEST VIEW
        var first = EngineersDay(week: 1, engineers: [])
        var cache = [(day: Engineer, night: Engineer)]()
        var eng1: Engineer = engineers.first!
        var eng2: Engineer!
        for (idx, engineer) in engineers.enumerated() {
            if idx % 2 == 0 {
                eng2 = engineer
                cache.append((day: eng1, night: eng2))
            } else {
                eng1 = engineer
            }
        }
        first.engineers = cache
        var second = first
        second.week = 2
        dataSource?.data.value = [first, second]
        // klo uda lgsg

    }
    
}
