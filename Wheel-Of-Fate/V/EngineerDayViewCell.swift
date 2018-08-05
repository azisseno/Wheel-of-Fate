//
//  EngineerDayViewCell.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit

class EngineerDayViewCell: UITableViewCell {

    @IBOutlet weak var engineersDayView: EngineerDayView!
    
    func setup(dayText: String, dayEngineer: String, nightEngineer: String) {
        engineersDayView.setup(dayText: dayText, dayEngineer: dayEngineer, nightEngineer: nightEngineer)
    }
    
}
