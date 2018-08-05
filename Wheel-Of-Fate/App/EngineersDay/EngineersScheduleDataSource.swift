//
//  EngineerScheduleDataSource.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import api


class Schedule {
    var date: Date
    var engineers: [Engineer] = []
    
    init(date: Date) {
        self.date = date
    }
    
    func add(engineer: Engineer) {
        self.engineers.append(engineer)
    }
}

class EngineersScheduleDataSource: GenericDataSource<Schedule>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "engineerCell", for: indexPath) as! EngineerDayViewCell
        let schedule = data.value[indexPath.row]
        cell.setup(dayText: schedule.date.toFullString(),
                   dayEngineer: schedule.engineers.first?.name ?? "No Engineer",
                   nightEngineer: schedule.engineers.last?.name ?? "No Engineer")
        return cell
    }
}
