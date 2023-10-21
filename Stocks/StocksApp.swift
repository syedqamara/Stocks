//
//  StocksApp.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import SwiftUI
import Dependencies
import WidgetKit

@main
struct StocksApp: App {
    @Dependency(\.viewFactory) var viewFactory: ViewFactory
    init() {
        WidgetCenter.shared.reloadTimelines(ofKind: "StockHome")
    }
    var body: some Scene {
        WindowGroup {
            AnyView(viewFactory.makeView(input: .stockExchange(exchange: nil)))
//            SectorView_Previews.previews
        }
    }
}
