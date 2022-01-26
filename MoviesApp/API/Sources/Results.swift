//
//  Results.swift
//  API
//
//  Created by Balamurugan on 25/01/2022.
//

import Foundation

public struct Results<T: Codable>: Codable {
    public let Search: T
    public let Error: String?
    public let Response: String?
}
