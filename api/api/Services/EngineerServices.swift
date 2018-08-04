//
//  EngineerServices.swift
//  api
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

public class EngineerServices {
    /**
     Get Contacts
     Path: /contacts.json
     */
    @discardableResult
    public static func getEngineers(
        progress: ((Double) -> ())? = nil,
        onSuccess: ((ObjectDataResponse<EngineerResponse>) -> ())? = nil,
        onFailure: ((ErrorResponse) -> ())? = nil) -> ApiRequest<ObjectDataResponse<EngineerResponse>> {
        
        return ApiRequest<ObjectDataResponse<EngineerResponse>>(
            path: "/4ffa3b555652c0f6772fee4c12abad9b/raw/4ea3d0aecbb7d12c587f12898e5cb5403a68eb5d/engineers.json",
            params: nil,
            method: .get,
            progress: progress,
            onSuccess: onSuccess,
            onFailure: onFailure
        )
    }
}
