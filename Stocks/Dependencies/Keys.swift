//
//  Keys.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import Dependencies

extension ViewFactory: DependencyKey {
    public static var liveValue: ViewFactory { .init() }
}

extension StockDataSource: DependencyKey {
    public static var liveValue: StockDataSource { .init() }
}
