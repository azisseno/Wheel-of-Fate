//
//  EngineersViewModel.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit
import api

struct EngineersViewModel {
    
    weak var dataSource: EngineersDataSource?

    init(dataSource: EngineersDataSource) {
        self.dataSource = dataSource
    }

    func load(completion: (() -> ())? = nil, fetchForce: Bool = false) {
        dataSource?.requestState.value = .loading(0)
        if !Connectivity.isConnectedToInternet {
            dataSource?.requestState.value = .error(Connectivity.error)
            return
        }
        EngineerServices.getEngineers(
            progress: { progress in
                self.dataSource?.requestState.value = .loading(progress)
        },
            onSuccess: { response in
                self.dataSource?.data.value = response.data.engineers
                self.dataSource?.requestState.value = .success
        },
            onFailure: { error in
                self.dataSource?.requestState.value = .error(error)
        }).call()
    }

}
