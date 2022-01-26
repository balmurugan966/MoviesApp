//
//  Session.swift
//  MoviesApp
//
//  Created by Balamurugan on 25/01/2022.
//

import Foundation
import API

final class Session {
    let client: TMDbClient

    init() {
        client = TMDbClient(apiKey: StringConstants.apikey)
    }
}
