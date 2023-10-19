//
//  DailyStockInfoViewModel.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

public class StockRankInfoViewModel: StockRankInfoViewModeling {
    @Published public var rank: StockRankInfoUIModel?
    public init(rank: StockRankInfoUIModel? = nil) {
        self.rank = rank
    }
}
