//
//  Values.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import Dependencies

extension DependencyValues {
    var viewFactory: ViewFactory {
        get { self[ViewFactory.self] }
        set { self[ViewFactory.self] = newValue }
    }
    var stockDataSource: StockDataSource {
        get { self[StockDataSource.self] }
        set { self[StockDataSource.self] = newValue }
    }
}
