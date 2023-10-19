//
//  StockExchangeViewModel.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

public class SectorsListViewModel: SectorListViewModeling {
    @Published public var sectors: [SectorUIModel]
    public init(sectors: [SectorUIModel] = []) {
        self.sectors = sectors
    }
}
