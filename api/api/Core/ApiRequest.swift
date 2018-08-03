//
//  ApiRequest.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire

public struct ApiRequest<T>: APIRequestProtocol where T: APIParser {
    
    public typealias ModelResponse = T
    public var path: String
    public var params: Parameters?
    public var method: HTTPMethod
    public var progress: ((Double) -> ())?
    public var onSuccess: ((ModelResponse) -> ())?
    public var onFailure: ((ErrorResponse) -> ())?

}
