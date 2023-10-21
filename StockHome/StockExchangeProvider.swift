//
//  StockExchangeProvider.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import WidgetKit
import SwiftUI
import Intents
import Dependencies
import Combine

struct StockExchangeProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> Entry {
        .init(date: .widgetRefreshData, selected: 0, sector: .init(from: .preview))
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (StockExchangeUIModelTimelineEntry) -> Void) {
        completion(
            .init(date: .widgetRefreshData, selected: 0, sector: .init(from: .preview))
        )
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        @Dependency(\.stockDataSource) var dataSource
        let sectors = dataSource.getStockExchange().sectors ?? []
        let randomNumber = random(from: 0, to: sectors.count)
        let sector = sectors[randomNumber]
        completion(
            .init(
                entries: [
                    .init(date: .widgetRefreshData, selected: randomNumber, sector: .init(from: sector))
                ],
                policy: .after(.widgetRefreshData)
            )
        )
    }
    
    typealias Entry = StockExchangeUIModelTimelineEntry
    typealias Intent = ConfigurationIntent
    
}


struct StockExchangeUIModelTimelineEntry: TimelineEntry {
    var date: Date
    let selected: Int
    var sector: SectorUIModel
}
