//
//  StringExternsions.swift
//  iOSUtilities
//
//  Created by Balamurugan on 25/01/2022.
//

import Foundation
import UIKit

extension String {
    /// it will convert string to date  and exact fommated date whichever we want
    /// - Returns: it will return a formatted date string
    public func getFormattedDate() -> String?{
        let dateFormatterGet = DateFormatter()
        let dateFormat = "dd MMM yyyy"
        dateFormatterGet.dateFormat = dateFormat
        
        let date: Date = dateFormatterGet.date(from: self) ?? Date()
        return dateFormatterGet.string(from: date)
    }

}

