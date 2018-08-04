//
//  Constants.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import api
public let baseURL: String = "https://gist.githubusercontent.com/azisseno"

enum RequestState {
    case initial
    case loading(Double)
    case success
    case error(ErrorResponse)
}

