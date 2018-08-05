//
//  Engineer.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 05/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import api

extension Engineer: Equatable {
    public static func == (lhs: Engineer, rhs: Engineer) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Engineer: Hashable {
    public var hashValue: Int {
        return id.hashValue
    }
}
