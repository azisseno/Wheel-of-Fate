//
//  Engineer.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Engineer: APIParser {
    public var id: UInt
    public var name: String
    
    public init(json: JSON) {
        self.id = json["id"].uIntValue
        self.name = json["name"].stringValue
    }

}

public struct EngineerResponse: APIParser {
    public var engineers: [Engineer]
    
    public init(json: JSON) {
        self.engineers = json["engineers"].arrayValue.map { Engineer(json: $0) }
    }
}
