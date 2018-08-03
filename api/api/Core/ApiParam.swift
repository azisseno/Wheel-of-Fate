//
//  ApiParam.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

public protocol ApiParam {
    init()
    func parameter() -> [String: Any]
}
