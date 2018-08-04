//
//  DynamicValue.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

class DynamicValue<T> {
    
    var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: (() -> ())]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping (() -> ())) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping (() -> ())) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    deinit {
        observers.removeAll()
    }
}

class GenericDataSource<T> : NSObject {
    var isEmpty: Bool {
        return data.value.count == 0
    }
    var data: DynamicValue<[T]> = DynamicValue([])
}
