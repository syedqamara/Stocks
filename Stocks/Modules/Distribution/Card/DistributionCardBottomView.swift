//
//  DistributionCardBottomView.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI


struct StockInfoView: View {
    @State var stock: StockInfoUIModel
    init(stock: StockInfoUIModel) {
        self.stock = stock
    }
    var body: some View {
        HStack(alignment: .center) {
            if let image = stock.image {
                Image(image: image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .roundedRectangle(cornerRadius: 15, lineWidth: 2, strokeColor: .clear, fillColor: .white)
            }
            VStack {
                Text(stock.title ?? "")
                    .appFont(
                        .medium(
                            isBold: false
                        )
                    )
                    .foregroundColor(.init(color: .lightGrey))
                Text(stock.value ?? "")
                    .appFont(
                        .large(
                            isBold: true
                        )
                    )
                    .foregroundColor(.init(color: .lightGrey))
            }
            
        }
    }
}
