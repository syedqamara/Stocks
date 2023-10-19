//
//  StockExchangeDataSource.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation

public protocol StockDataSourcing: DataSourcing {
    func getStockExchange() -> StockExchange
}

public class StockDataSource: StockDataSourcing {
    
    public func getStockExchange() -> StockExchange {
        if let exchange = FileReader.load("stock_exchange", fileExtension: "json", as: StockExchange.self) {
            return exchange
        }
        let stock = dummyJSON()
        let pretty = stock.toJSONString() ?? ""
        print(pretty)
        return stock
    }
    private func dummyJSON() -> StockExchange {
        StockExchange(
            sectors: [
                .init(
                    name: "Oil & Gas",
                    distributions: [
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
                        ),
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
                    ],
                    daily_stock_rank: .init(
                        most_gain: .init(
                            title: "Today's Stock Gainer",
                            name: "ARAMCO",
                            image: "graph_up",
                            value: "+9.89%",
                            color: "#259210"
                        ),
                        most_drop: .init(
                            title: "Today's Stock Drop",
                            name: "ASEER",
                            image: "graph_down",
                            value: "+10.00%",
                            color: "#c72237"
                        )
                    )
                ),
                .init(
                    name: "Power Sector",
                    distributions: [
                        .init(
                            name: "WAPDA",
                            image: "brand_logo",
                            stocks: [
                                .init(
                                    title: "Stocks",
                                    value: "2",
                                    image: nil
                                ),
                                .init(
                                    title: "Profit/Loss",
                                    value: "9.89%",
                                    image: "graph_up"
                                )
                            ]
                        ),
                        .init(
                            name: "LESCO",
                            image: "brand_logo",
                            stocks: [
                                .init(
                                    title: "Stocks",
                                    value: "12",
                                    image: nil
                                ),
                                .init(
                                    title: "Profit/Loss",
                                    value: "10.00%",
                                    image: "graph_down"
                                )
                            ]
                        )
                    ],
                    daily_stock_rank: .init(
                        most_gain: .init(
                            title: "Today's Stock Gainer",
                            name: "ARAMCO",
                            image: "graph_up",
                            value: "+9.89%",
                            color: "#259210"
                        ),
                        most_drop: .init(
                            title: "Today's Stock Drop",
                            name: "ASEER",
                            image: "graph_down",
                            value: "+10.00%",
                            color: "#c72237"
                        )
                    )
                )
            ]
        )
    }
}
