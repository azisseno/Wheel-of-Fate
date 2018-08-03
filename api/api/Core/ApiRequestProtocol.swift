//
//  ApiRequestProtocol.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 03/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol APIRequestProtocol {
    associatedtype ModelResponse: APIParser
    var path: String { get }
    var params: Parameters? { get }
    var method: Alamofire.HTTPMethod { get }
    var progress: ((Double) -> ())? { get }
    var onSuccess: ((ModelResponse) -> ())? { get }
    var onFailure: ((ErrorResponse) -> ())? { get }
}

extension APIRequestProtocol {
    @discardableResult
    public func call() -> DataRequest {
        return Alamofire.request(Api.shared.baseURL + path,
                                 method: method,
                                 parameters: params,
                                 encoding: JSONEncoding.default,
                                 headers: nil)
            .downloadProgress(closure: { (prg) in
                print(prg.fractionCompleted)
                self.progress?(prg.fractionCompleted)
            })
            .responseJSON { (response) in
                switch response.result {
                case .success(let json):
                    let json = JSON(json)
                    self.handleResponseJSON(response: response, json: json)
                case .failure(let err):
                    self.handleAlamoforeError(response: response, err: err)
                }
        }
    }
    
    private func handleResponseJSON(response: DataResponse<Any>, json: JSON) {
        if json["error"].exists() || json["errors"].exists() {
            let errorResponse: ErrorResponse = ErrorResponse(json: json)
            onFailure?(errorResponse)
        } else if let statusCode = response.response?.statusCode,
            (statusCode >= 200 && statusCode < 300 || statusCode == 403) {
            let model: ModelResponse = ModelResponse(json: json)
            onSuccess?(model)
        } else {
            let errorResponse: ErrorResponse = ErrorResponse(
                status: "\(response.response?.statusCode ?? 502)",
                message: response.result.error?.localizedDescription ?? "Unknown Error")
            onFailure?(errorResponse)
        }
    }
    
    private func handleAlamoforeError(response: DataResponse<Any>, err: Error) {
        let statusCode: Int = response.response?.statusCode ?? 520
        let error: ErrorResponse = ErrorResponse(status: "\(statusCode)", message: err.localizedDescription)
        onFailure?(error)
    }
}
