//
//  EngineersDayDataSource.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import api

struct EngineersDay {
    var week: Int
    var engineers: [(day: Engineer, night: Engineer)] = []
}

class EngineersDayDataSource: GenericDataSource<EngineersDay>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value[section].engineers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "engineerCell", for: indexPath) as! EngineerDayViewCell
        let engineer = data.value[indexPath.section].engineers[indexPath.row]
        cell.setup(dayText: Days.nameOf(number: indexPath.row),
                   dayEngineer: engineer.day.name,
                   nightEngineer: engineer.night.name)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Week \(data.value[section].week)"
    }
}
