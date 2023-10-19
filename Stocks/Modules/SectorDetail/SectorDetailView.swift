//
//  SectorDetailView.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import SwiftUI
import Dependencies

public struct SectorDetailView<T: SectorDetailViewModeling>: SectorDetailViewing {
    public typealias VM = T
    @ObservedObject private var viewModel: T
    @Dependency(\.viewFactory) var viewFactory: ViewFactory
    public init(viewModel: T) {
        self.viewModel = viewModel
    }
    public func selectedDistributionIndex(to: Int) -> Int {
        random(from: 0, to: to)
    }
    public var body: some View {
        VStack(alignment: .leading) {
            if let sector = viewModel.sector {
                AnyView(
                    viewFactory.makeView(
                        input: .sector(
                            sector: sector,
                            selectedDistribution: 0
                        )
                    )
                )
                .padding([.bottom], 20)
            }
            if let dailyRank = viewModel.sector?.dailyStockRank {
                self.storeRankInfo(rank: dailyRank.mostGain)
                Spacer()
                    .frame(width: UIScreen.main.bounds.size.width, height: 1)
                    .roundedRectangle(cornerRadius: 0.0, lineWidth: 0.0, strokeColor: .clear, fillColor: .gray)
                self.storeRankInfo(rank: dailyRank.mostDrop)

            }
        }
    }
    @ViewBuilder
    func storeRankInfo(rank: StockRankInfoUIModel?) -> some View {
        VStack {
            Spacer()
                .frame(width: Config.shared.screenWidth, height: 10)
            HStack {
                #if iOSApp
                Spacer()
                    .frame(width: Config.Spacing.medium.rawValue, height: 1)
                #elseif WidgetApp
                Spacer()
                    .frame(width: Config.Spacing.large.rawValue, height: 1)
                #endif
                AnyView(
                    viewFactory
                    .makeView(
                        input: .stockRankInfo(rank: rank)
                    )
                )
                Spacer()
                    .frame(width: Config.Spacing.medium.rawValue, height: 1)
            }
            Spacer()
                .frame(width: Config.shared.screenWidth, height: 10)
        }
    }
}
