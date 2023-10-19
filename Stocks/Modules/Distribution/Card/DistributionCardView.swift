//
//  CardView.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI
import Dependencies


struct DistributionCardView<T: DistributionViewModeling >: DistributionCardViewing, View {
    typealias VM = T
    @ObservedObject private var viewModel: T
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    var body: some View {
        HStack {
            VStack {
                if let distribution = viewModel.distribution {
                    cardTopView(distribution: distribution)
                        .pad(padding: .padding([.top, .leading, .trailing], .small))
                    Spacer()
                        .frame(height: 50)
                    if let stocks = distribution.stocks {
                        if stocks.count > 3 {
                            ScrollView(.horizontal) {
                                cardBottomView(stocks: stocks)
                            }
                            .pad(padding: .padding([.bottom, .leading, .trailing], .small))
                        } else {
                            cardBottomView(stocks: stocks)
                                .pad(padding: .padding([.bottom, .leading, .trailing], .small))
                        }
                    }
                }
            }
        }
        .roundedRectangle(cornerRadius: 8, lineWidth: 0.0, strokeColor: .clear, fillColor: .green, showShadow: true)
        .padding(20)
    }
    
    func cardTopView(distribution: DistributionUIModel) -> some View {
        HStack(spacing: 20) {
            Image(image: distribution.image ?? .brandLogo)
                .resizable()
                .frame(width: 30, height: 30)
                .roundedRectangle(cornerRadius: 0, lineWidth: 2, strokeColor: .orange, fillColor: .clear)
            Text(distribution.name ?? "")
                .appFont(
                    .medium(
                        isBold: false
                    )
                )
            Spacer()
            Button {
                
            } label: {
                Image(image: .pencil)
                    .resizable()
                    .appFont(
                        .small(
                            isBold: false
                        )
                    )
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .space(
                        space: pencilImageSpacing
                    )
                    .roundedRectangle(cornerRadius: 15, lineWidth: 2, strokeColor: .blue, fillColor: .blue)
                
            }

        }
    }
    var pencilImageSpacing: Config.Spacing {
        #if iOSApp
            .xSmall
        #elseif WidgetApp
            .small
        #endif
    }
    func cardBottomView(stocks: [StockInfoUIModel]) -> some View {
        HStack {
            ForEach(stocks.indices, id: \.self) { index in
                StockInfoView(stock: stocks[index])
                if index < stocks.count - 1 {
                    Spacer()
                }
            }
        }
    }
    func section(title: String, subtitle: String) -> some View {
        VStack {
            Text(title)
                .appFont(
                    .small(
                        isBold: false
                    )
                )
                .foregroundColor(.init(color: .lightGrey))
            Text(subtitle)
                .appFont(
                    .medium(
                        isBold: true
                    )
                )
                .foregroundColor(.init(color: .lightGrey))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    @Dependency(\.viewFactory) static var viewFactory: ViewFactory
    @Dependency(\.stockDataSource) static var mockDataSource: StockDataSource
    static var data: DistributionUIModel {
        let exchange = mockDataSource.getStockExchange()
        return .init(from: exchange.sectors?.first?.distributions?.first)
    }
    static var previews: some View {
        AnyView(viewFactory.makeView(input: .distribution(distribution: data)))
    }
}
