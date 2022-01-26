//
//  Optionals.swift
//  iOSUtilities
//
//  Created by Balamurugan on 25/01/2022.
//

import Foundation

extension Optional {
    public func isNil<T>(value: T) -> T {
        if self != nil {
            return self as! T
        }
        return value
    }
}
