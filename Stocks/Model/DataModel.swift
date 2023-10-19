//
//  Distribution.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation

// MARK: - StockExchange
/// Represents a stock exchange, including its daily stock rank and sectors.
public struct StockExchange: Codable {
    /// An array of sectors within the stock exchange.
    public let sectors: [Sector]?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sectors = try container.decodeIfPresent([Sector].self, forKey: .sectors)
    }
    public init(sectors: [Sector]?) {
        
        self.sectors = sectors
    }
}

// MARK: - Sector
/// Represents a sector within a stock exchange, including its name and distributions.
public struct Sector: Codable {
    /// The name of the sector.
    public let name: String?
    /// An array of distributions within this sector.
    public let distributions: [Distribution]?
    /// Information about the daily stock rank, including most gain and most drop.
    public let daily_stock_rank: DailyStockRank?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.distributions = try container.decodeIfPresent([Distribution].self, forKey: .distributions)
        self.daily_stock_rank = try container.decodeIfPresent(DailyStockRank.self, forKey: .daily_stock_rank)
    }
    public init(name: String?, distributions: [Distribution]?, daily_stock_rank: DailyStockRank?) {
        self.name = name
        self.distributions = distributions
        self.daily_stock_rank = daily_stock_rank
    }
}

// MARK: - Distribution
/// Represents the distribution of stocks within a sector, including name, image, and stock information.
public struct Distribution: Codable {
    /// The name of the distribution.
    public let name: String?
    /// An optional image URL associated with this distribution.
    public let image: String?
    /// An array of stock information within this distribution.
    public let stocks: [StockInfo]?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.stocks = try container.decodeIfPresent([StockInfo].self, forKey: .stocks)
    }
    public init(name: String?, image: String?, stocks: [StockInfo]?) {
        self.name = name
        self.image = image
        self.stocks = stocks
    }
}

// MARK: - StockInfo
/// Represents information about a stock, including its title, value, and an optional image.
public struct StockInfo: Codable {
    /// The title or name of the stock.
    public let title: String?
    /// The value or price of the stock.
    public let value: String?
    /// An optional image URL associated with this stock.
    public let image: String?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }
    public init(title: String?, value: String?, image: String?) {
        self.title = title
        self.value = value
        self.image = image
    }
}

// MARK: - StockRankInfo
/// Represents ranking information about a stock, including its title, name, value, and color.
public struct StockRankInfo: Codable {
    /// The title of the ranking (e.g., "Most Gained").
    public let title: String?
    /// The name of the stock.
    public let name: String?
    /// The image of the stock.
    public let image: String?
    /// The value or ranking of the stock.
    public let value: String?
    /// The color associated with the ranking for visualization.
    public let color: String?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
    }
    public init(title: String?, name: String?, image: String?, value: String?, color: String?) {
        self.title = title
        self.name = name
        self.value = value
        self.color = color
        self.image = image
    }
    
}

// MARK: - DailyStockRank
/// Represents the daily stock rank, including the most gained and most dropped stocks.
public struct DailyStockRank: Codable {
    /// Information about the stock that had the most gain.
    public let most_gain: StockRankInfo?
    /// Information about the stock that had the most drop.
    public let most_drop: StockRankInfo?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.most_gain = try container.decodeIfPresent(StockRankInfo.self, forKey: .most_gain)
        self.most_drop = try container.decodeIfPresent(StockRankInfo.self, forKey: .most_drop)
    }
    public init(most_gain: StockRankInfo?, most_drop: StockRankInfo?) {
        self.most_gain = most_gain
        self.most_drop = most_drop
    }
}
