//
//  EngineersDataSource.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import api
import UIKit

class EngineersDataSource : GenericDataSource<Engineer>, UITableViewDataSource {
    
    var requestState: DynamicValue<RequestState> = DynamicValue<RequestState>(.initial)

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch requestState.value {
        case .success:
            return data.value.count
        case .error(_ ):
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "engineerCell", for: indexPath)
        let engineer = data.value[indexPath.row]
        cell.textLabel?.text = engineer.name
        return cell
    }
}
