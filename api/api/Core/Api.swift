//
//  Api.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

public struct Api {
    
    var baseURL: String {
        return basePath
    }
    private var basePath: String
    
    init(basePath: String) {
        self.basePath = basePath
    }
    
    private static var instance: Api!
    static var shared: Api {
        return instance
    }
    
    public static func initInstance(basePath: String) {
        instance = Api(basePath: basePath)
    }
}
