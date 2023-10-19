//
//  StockExchangeViewModel.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

public class StockExchangeViewModel: StockExchangeViewModeling {
    @Published public var isLoading: Bool = false
    @Published public var error: String? = nil
    @Published public var exchange: StockExchangeUIModel?
    
    private var dataSource: StockDataSourcing?
    public required init(exchange: StockExchangeUIModel?, dataSource: StockDataSourcing?) {
        self.exchange = exchange
        self.dataSource = dataSource
    }
    public func reloadData() {
//        self.isLoading = true
        guard let stockExchangeDataModel = dataSource?.getStockExchange() else { return }
//        self.isLoading = false
        self.exchange = StockExchangeUIModel(from: stockExchangeDataModel)
    }
    
}
