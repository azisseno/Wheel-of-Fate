//
//  Array.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 05/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> Element? {
        guard !isEmpty else { return nil }
        let randomIndex: Int = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
    func take(last index: Int) -> [Element] {
        if index < count {
            return Array(suffix(index))
        }
        return self
    }
}
extension Array where Element: Equatable {
    mutating func remove(_ element: Element) {
        if let index = index(where: { $0 == element }) {
            remove(at: index)
        }
    }
}
