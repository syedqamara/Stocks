//
//  PreviewSnapshot.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

extension StockExchange {
    public static var preview: StockExchange {
        StockExchange(
            sectors: [
                .preview
            ]
        )
    }
}
extension Sector {
    public static var preview: Sector {
        .init(
            name: "Oil & Gas",
            distributions: [
                .preview,
                .preview2
            ],
            daily_stock_rank: .preview
        )
    }
}
extension StockRankInfo {
    public static var preview: StockRankInfo {
        .init(
            title: "Today's Stock Gainer",
            name: "ASD",
            image: "graph_up",
            value: "+9.89%",
            color: "#259210"
        )
    }
    public static var preview2: StockRankInfo {
        .init(
            title: "Today's Stock Drop",
            name: "ASEER",
            image: "graph_down",
            value: "+10.00%",
            color: "#c72237"
        )
    }
}
extension DailyStockRank {
    public static var preview: DailyStockRank {
        .init(
            most_gain: .preview,
            most_drop: .preview2
        )
    }
}
extension Date {
    public static var widgetRefreshData: Date {
        Date().entryDate(time: 2)
    }
    public func entryDate(time: Int) -> Date {
        Calendar.current.date(byAdding: .second, value: time, to: self)!
    }
}
extension Distribution {
    public static var preview: Distribution {
        .init(
            name: "ARAMCO",
            image: "brand_logo",
            stocks: [
                .init(
                    title: "Stocks",
                    value: "12",
                    image: nil
                ),
                .init(
                    title: "Profit/Loss",
                    value: "9.89%",
                    image: "graph_up"
                )
            ]
        )
    }
    public static var preview2: Distribution {
        .init(
            name: "ASEER",
            image: "brand_logo",
            stocks: [
                .init(
                    title: "Stocks",
                    value: "2",
                    image: nil
                ),
                .init(
                    title: "Profit/Loss",
                    value: "10.00%",
                    image: "graph_down"
                )
            ]
        )
    }
}
