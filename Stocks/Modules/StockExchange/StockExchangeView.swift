//
//  StockExchangeView.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import SwiftUI
import Dependencies

public struct StockExchangeView<T: StockExchangeViewModeling>: StockExchangeViewing {
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
            if viewModel.isLoading {
                ProgressView {
                    Text("Loading...")
                }
            }
            if let sectors = viewModel.exchange?.sectors {
                AnyView(
                    viewFactory.makeView(
                        input: .sectors(
                            sectors: sectors,
                            selectedDistribution: 0
                        )
                    )
                )
            }
        }
        .onAppear() {
            if viewModel.exchange == nil {
                viewModel.reloadData()
            }
        }
    }
}
