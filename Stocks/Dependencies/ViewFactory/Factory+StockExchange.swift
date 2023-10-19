//
//  Factory+StockExchange.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import Dependencies

extension ViewFactory {
    public enum StockExchangeViewInput {
        case stockExchange(exchange: StockExchangeUIModel?)
        case distribution(distribution: DistributionUIModel?)
        case sectorDetail(sector: SectorUIModel?, selectedDistribution: Int)
        case sector(sector: SectorUIModel?, selectedDistribution: Int)
        case sectors(sectors: [SectorUIModel], selectedDistribution: Int)
        case stockRankInfo(rank: StockRankInfoUIModel?)
    }
    public func makeView(input: StockExchangeViewInput) -> any Viewing {
        switch input {
        case .distribution(distribution: let dist):
            return DistributionCardView(
                viewModel: DistributionViewModel(
                    distribution: dist
                )
            )
        case .sector(sector: let sector, let selectedDist):
            return SectorView(
                viewModel: SectorViewModel(
                    sector: sector,
                    selectedDistribution: selectedDist
                )
            )
        case .stockRankInfo(rank: let rank):
            return StockRankInfoView(
                viewModel: StockRankInfoViewModel(
                    rank: rank
                )
            )
        case .stockExchange(exchange: let exchange):
            @Dependency(\.stockDataSource) var dataSource
            return StockExchangeView(
                viewModel: StockExchangeViewModel(
                    exchange: exchange,
                    dataSource: dataSource
                )
            )
        case .sectors(sectors: let sectors, selectedDistribution: _):
            return SectorsListView(
                viewModel: SectorsListViewModel(
                    sectors: sectors
                )
            )
        case .sectorDetail(sector: let sector, selectedDistribution: _):
            return SectorDetailView(
                viewModel: SectorDetailViewModel(
                    sector: sector
                )
            )
        }
    }
}
