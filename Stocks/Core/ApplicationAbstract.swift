//
//  Abstract.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation


// MARK: Stock Exchange
public protocol StockExchangeViewing: Viewing where VM: StockExchangeViewModeling {}
public protocol StockExchangeViewModeling: ObservableViewModel {
    var isLoading: Bool { get set }
    var error: String? { get }
    var exchange: StockExchangeUIModel? { get set }
    init(exchange: StockExchangeUIModel?, dataSource: StockDataSourcing?)
    func reloadData()
}

// MARK: Sector List View
public protocol SectorListViewing: Viewing where VM: SectorListViewModeling {}
public protocol SectorListViewModeling: ObservableViewModel {
    var sectors: [SectorUIModel] { get set }
}

// MARK: Sector Detail View
public protocol SectorDetailViewing: Viewing where VM: SectorDetailViewModeling {}
public protocol SectorDetailViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
}

// MARK: Distribution
public protocol DistributionCardViewing: Viewing where VM: DistributionViewModeling {}
public protocol DistributionViewModeling: ObservableViewModel {
    var distribution: DistributionUIModel? { get set }
}

// MARK: Sector
public protocol SectorViewing: Viewing where VM: SectorViewModeling {}
public protocol SectorViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
    var selectedDistribution: Int { get set }
}


// MARK: Daily Stock Info
public protocol StockRankInfoViewing: Viewing where VM: StockRankInfoViewModeling {}
public protocol StockRankInfoViewModeling: ObservableViewModel {
    var rank: StockRankInfoUIModel? { get set }
}

