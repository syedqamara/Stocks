//
//  Sector.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
// MARK: - DailyStockRankUIModel
// UI Model for representing the daily stock rank within a stock exchange.
public struct DailyStockRankUIModel {
    public var mostGain: StockRankInfoUIModel?
    public var mostDrop: StockRankInfoUIModel?

    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: DailyStockRank?) {
        // Transform the most_gain and most_drop data using the StockRankInfoUIModel initializer.
        mostGain = StockRankInfoUIModel(from: dataModel?.most_gain)
        mostDrop = StockRankInfoUIModel(from: dataModel?.most_drop)
    }
}

// MARK: - StockInfoUIModel
// UI Model for representing information about a stock, suitable for display.
public struct StockInfoUIModel: Identifiable {
    public var title: String?
    public var value: String?
    public var image: Assets.Image?

    public var id: String { title ?? "N/A" }
    
    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: StockInfo?) {
        title = dataModel?.title
        value = dataModel?.value
        if let img = dataModel?.image, let assetImage = Assets.Image(rawValue: img) {
            self.image = assetImage
        }else {
            image = nil
        }
    }
}

// MARK: - StockRankInfoUIModel
// UI Model for representing ranking information about a stock.
public struct StockRankInfoUIModel {
    public var title: String?
    public var name: String?
    public var image: Assets.Image?
    public var value: String?
    public var color: String?

    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: StockRankInfo?) {
        title = dataModel?.title
        name = dataModel?.name
        value = dataModel?.value
        color = dataModel?.color
        if let img = dataModel?.image, let assetImage = Assets.Image(rawValue: img) {
            self.image = assetImage
        }else {
            image = nil
        }
    }
}

// MARK: - DistributionUIModel
// UI Model for representing the distribution of stocks within a sector.
public struct DistributionUIModel: Hashable, Identifiable {
    public var name: String?
    public var image: Assets.Image?
    public var stocks: [StockInfoUIModel]?
    public var id: String { name ?? "" + (image?.rawValue ?? "N/A")}
    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: Distribution?) {
        name = dataModel?.name
        if let img = dataModel?.image, let assetImage = Assets.Image(rawValue: img) {
            self.image = assetImage
        }else {
            image = nil
        }
        // Transform the array of stock information using the StockInfoUIModel initializer.
        stocks = dataModel?.stocks?.map { StockInfoUIModel(from: $0) }
    }
    public static func == (lhs: DistributionUIModel, rhs: DistributionUIModel) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}

// MARK: - SectorUIModel
// UI Model for representing a sector within a stock exchange.
public struct SectorUIModel: Identifiable {
    public var name: String?
    public var distributions: [DistributionUIModel]?
    public var dailyStockRank: DailyStockRankUIModel?
    public var id: String { name ?? distributions?.first?.id ?? "N/A" }
    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: Sector?) {
        name = dataModel?.name
        // Transform the array of distributions using the DistributionUIModel initializer.
        distributions = dataModel?.distributions?.map { DistributionUIModel(from: $0) }
        dailyStockRank = DailyStockRankUIModel(from: dataModel?.daily_stock_rank)
    }
}

// MARK: - StockExchangeUIModel
// UI Model for representing a stock exchange, suitable for display.
public struct StockExchangeUIModel {
    public var sectors: [SectorUIModel]?

    // Initialize the UI Model from the corresponding Data Model.
    public init(from dataModel: StockExchange?) {
        // Transform the daily_stock_rank and sectors data using the respective UI Model initializers.
        sectors = dataModel?.sectors?.map { SectorUIModel(from: $0) }
    }
}
