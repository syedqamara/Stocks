//
//  Abstract.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation


// MARK: Stock Exchange
/// Protocol for a view that represents a stock exchange.
public protocol StockExchangeViewing: Viewing where VM: StockExchangeViewModeling {}

/// Protocol for the view model of a stock exchange view.
public protocol StockExchangeViewModeling: ObservableViewModel {
    var isLoading: Bool { get set }
    var error: String? { get }
    var exchange: StockExchangeUIModel? { get set }
    
    /// Initializes the view model with exchange data and a data source.
    /// - Parameters:
    ///   - exchange: The stock exchange data to display.
    ///   - dataSource: The data source for stock-related data.
    init(exchange: StockExchangeUIModel?, dataSource: StockDataSourcing?)
    
    /// Reloads the data in the view.
    func reloadData()
}

// Example Usage:
// - A `StockExchangeViewing` conforming view can display stock exchange information.
// - A `StockExchangeViewModeling` conforming view model can manage the exchange data and loading state.
// - Example Usage: A mobile app showing real-time stock exchange details.

// Example Test Cases:
// - Test loading stock exchange data.
// - Test handling errors when loading data.
// - Test reloading data in the view.

// MARK: Sector List View
/// Protocol for a view that displays a list of sectors.
public protocol SectorListViewing: Viewing where VM: SectorListViewModeling {}

/// Protocol for the view model of a sector list view.
public protocol SectorListViewModeling: ObservableViewModel {
    var sectors: [SectorUIModel] { get set }
}

// Example Usage:
// - A `SectorListViewing` conforming view can list various stock sectors.
// - A `SectorListViewModeling` conforming view model can manage the sector data.
// - Example Usage: A financial app displaying a list of stock market sectors.

// Example Test Cases:
// - Test populating the list of sectors.
// - Test handling updates to the sector list.

// MARK: Sector Detail View
/// Protocol for a view that displays details of a specific sector.
public protocol SectorDetailViewing: Viewing where VM: SectorDetailViewModeling {}

/// Protocol for the view model of a sector detail view.
public protocol SectorDetailViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
}

// Example Usage:
// - A `SectorDetailViewing` conforming view can show in-depth information about a stock sector.
// - A `SectorDetailViewModeling` conforming view model can manage sector-specific data.
// - Example Usage: Viewing detailed information about a particular stock sector.

// Example Test Cases:
// - Test displaying sector-specific data.
// - Test handling updates to the sector details.

// MARK: Distribution
/// Protocol for a view that displays distribution data.
public protocol DistributionCardViewing: Viewing where VM: DistributionViewModeling {}

/// Protocol for the view model of a distribution card view.
public protocol DistributionViewModeling: ObservableViewModel {
    var distribution: DistributionUIModel? { get set }
}

// Example Usage:
// - A `DistributionCardViewing` conforming view can display asset distribution in a portfolio.
// - A `DistributionViewModeling` conforming view model can manage the distribution data.
// - Example Usage: Visualizing the distribution of assets in an investment portfolio.

// Example Test Cases:
// - Test displaying distribution data.
// - Test updating distribution information.

// MARK: Sector
/// Protocol for a view representing a stock sector.
public protocol SectorViewing: Viewing where VM: SectorViewModeling {}

/// Protocol for the view model of a sector view.
public protocol SectorViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
    var selectedDistribution: Int { get set }
}

// Example Usage:
// - A `SectorViewing` conforming view can represent a stock sector.
// - A `SectorViewModeling` conforming view model can manage sector-specific data and user selection.
// - Example Usage: Displaying details of a stock sector and allowing the user to select a distribution.

// Example Test Cases:
// - Test displaying sector data.
// - Test updating sector information.
// - Test handling user selection of distribution.

// MARK: Daily Stock Info
/// Protocol for a view displaying daily stock rank information.
public protocol StockRankInfoViewing: Viewing where VM: StockRankInfoViewModeling {}

/// Protocol for the view model of a daily stock rank info view.
public protocol StockRankInfoViewModeling: ObservableViewModel {
    var rank: StockRankInfoUIModel? { get set }
}

// Example Usage:
// - A `StockRankInfoViewing` conforming view can show daily stock ranking information.
// - A `StockRankInfoViewModeling` conforming view model can manage the rank data.
// - Example Usage: Displaying the rank of stocks based on their daily performance.

// Example Test Cases:
// - Test displaying daily stock rank data.
// - Test handling updates to the rank information.
