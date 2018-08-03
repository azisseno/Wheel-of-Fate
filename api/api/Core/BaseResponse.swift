//
//  BaseResponse.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ObjectDataResponse<T>: APIParser where T: APIParser {
    public var data: T
    public init(json: JSON) {
        guard let _ = json.dictionary else {
            fatalError("DataResponse must be a Dictionary")
        }
        data = T(json: json)
    }
}

public struct ArrayDataResponse<T>: APIParser where T: APIParser {
    public var data: [T]
    public init(json: JSON) {
        guard let jsonArray = json.array else {
            fatalError("DataResponse must be an Array")
        }
        data = jsonArray.map { (json) -> T in
            return T(json: json)
        }
    }
}

public struct ErrorResponse: APIParser {
    public var status: String
    public var message: String

    public init(json: JSON) {
        status = json["status"].string ?? "520"
        if let errorText = json["error"].string {
            message = errorText
        } else if let errorText = json["errors"].arrayObject as? [String] {
            message = errorText.first ?? ""
        } else {
            message = "Unknown error"
        }
        
    }
    
    init(status: String, message: String) {
        self.status = status
        self.message = message
    }
}
