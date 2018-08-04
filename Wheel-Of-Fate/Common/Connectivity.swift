//
//  Connectivity.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire
import api

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    class var error: ErrorResponse {
        var error = ErrorResponse(json: [:])
        error.status = "520"
        error.message = "Internet connection appears to be offline"
        return error
    }
}
