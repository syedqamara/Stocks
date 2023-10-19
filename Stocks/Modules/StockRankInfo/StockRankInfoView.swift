//
//  StockRankInfoView.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import SwiftUI

public struct StockRankInfoView<T: StockRankInfoViewModeling>: StockRankInfoViewing {
    public typealias VM = T
    @ObservedObject private var viewModel: T
    public init(viewModel: T) {
        self.viewModel = viewModel
    }
    public var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .center) {
                if let image = viewModel.rank?.image {
                    Image(image: image)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .roundedRectangle(cornerRadius: 10, lineWidth: 0, strokeColor: .clear, fillColor: .white)
                }
                Text(viewModel.rank?.title ?? "")
                    .appFont(
                        .small(
                            isBold: true
                        )
                    )
                    .foregroundColor(.gray)
            }
            HStack(alignment: .center) {
                Text(viewModel.rank?.name ?? "")
                    .appFont(
                        .small(
                            isBold: true
                        )
                    )
                    .foregroundColor(.black)
                Spacer()
                Text(viewModel.rank?.value ?? "")
                    .appFont(
                        .small(
                            isBold: true
                        )
                    )
                    .foregroundColor(.init(hex: viewModel.rank?.color ?? ""))
            }
        }
    }
}
