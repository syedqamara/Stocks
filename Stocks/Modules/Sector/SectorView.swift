//
//  SectorView.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import SwiftUI
import Dependencies

struct SectorView<T: SectorViewModeling>: SectorViewing {
    typealias VM = T
    @Dependency(\.viewFactory) var viewFactory: ViewFactory
    @ObservedObject var viewModel: T
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            if let distributions = viewModel.sector?.distributions {
                PagingScrollView(pageCount: distributions.count, currentPage: $viewModel.selectedDistribution) { page in
                    AnyView(
                        viewFactory.makeView(
                            input: .distribution(
                                distribution: distributions[page]
                            )
                        )
                    )
                }
                .frame(maxHeight: 180)
//                .roundedRectangle(cornerRadius: 8, lineWidth: 0.0, strokeColor: .clear, fillColor: .green, showShadow: true)
            }
        }
    }
}

struct SectorView_Previews: PreviewProvider {
    @Dependency(\.viewFactory) static var viewFactory: ViewFactory
    @Dependency(\.stockDataSource) static var mockDataSource: StockDataSource
    static var data: SectorUIModel {
        let exchange = mockDataSource.getStockExchange()
        return .init(from: exchange.sectors?.first)
    }
    static var previews: some View {
        AnyView(viewFactory.makeView(input: .sector(sector: data, selectedDistribution: 0)))
    }
}
