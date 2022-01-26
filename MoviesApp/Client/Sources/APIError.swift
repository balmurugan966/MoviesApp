//
//  APIError.swift
//  Client
//
//  Created by Balamurugan on 25/01/2022.
//

import Foundation

public struct APIError: Swift.Error {
    let errorData: Data
    
    public init(_ data: Data) {
        errorData = data
    }
}
