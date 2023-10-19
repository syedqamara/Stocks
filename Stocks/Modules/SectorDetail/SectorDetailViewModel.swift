//
//  StockExchangeViewModel.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

public class SectorDetailViewModel: SectorDetailViewModeling {
    @Published public var sector: SectorUIModel?
    public init(sector: SectorUIModel?) {
        self.sector = sector
    }
}
