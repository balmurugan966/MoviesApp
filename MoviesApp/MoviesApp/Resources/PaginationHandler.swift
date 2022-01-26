//
//  PaginationHandler.swift
//  iOSUtilities
//
//  Created by Balamurugan on 26/01/22.
//

import Foundation

/// Struct, handling the control of requesting list of items with pagination
struct PaginationHandler {

    private static let defaultPageSize = 10

    /// Number of current page (portion) ot items
    private(set) var currentPage: Int = 1
    /// Size of a single page (portion) or items
    let pageSize: Int

    /// Create PaginationHandler, with the desired size of a single page. 10, by default.
    /// - Parameter pageSize: Size of a single page (portion) or items
    init(pageSize: Int = defaultPageSize) {
        self.pageSize = pageSize
    }

    private mutating func increase() {
        currentPage += 1
    }

    private mutating func invalidate() {
        currentPage = -1
    }

    /// Resetting the handler to it's initial state
    mutating func reset() {
        currentPage = 1
    }

    /// Notifying the handler, that items have been received
    /// - Parameter count: number of items
    mutating func totalItemsReceived(_ count: Int) {
        if count < self.pageSize {
            invalidate()
        } else {
            increase()
        }
    }

    /// Informing the caller, if more items can be fetched
    func canFetchMore() -> Bool {
        return currentPage > 0
    }
}

