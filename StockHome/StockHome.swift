//
//  StockHome.swift
//  StockHome
//
//  Created by Apple on 17/10/2023.
//

import WidgetKit
import SwiftUI
import Intents
import Dependencies

struct StockHomeEntryView : View {
    var entry: StockExchangeProvider.Entry
    @Dependency(\.viewFactory) var viewFactory: ViewFactory
    var body: some View {
        GeometryReader { geometry in
            if Config.shared.updateScreenWidth(width: geometry.size.width) {
                sectorDetailView(
                    sector: entry.sector
                )
            }
            else {
                EmptyView()
            }
        }
        .widgetURL(.init(string: Config.shared.deeplink(.sectors(selectedIndex: entry.selected))))
    }
    
    @ViewBuilder
    func sectorDetailView(sector: SectorUIModel) -> some View {
        AnyView(
            viewFactory.makeView(input: .sectorDetail(sector: sector, selectedDistribution: 0))
        )
    }
}

struct StockHome: Widget {
    
    let kind: String = "StockHome"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: StockExchangeProvider()) { entry in
            StockHomeEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies(supportedFamilies)
    }
    private let supportedFamilies:[WidgetFamily] = {
        if #available(iOSApplicationExtension 15.0, *) {
            return [.systemLarge, .systemExtraLarge]
        } else {
            return [.systemLarge]
        }
    }()
}

//struct StockHome_Previews: PreviewProvider {
//    static var previews: some View {
//        StockHomeEntryView(entry: StockExchangeUIModelTimelineEntry(date: .now, exchange: .init(from: .preview)))
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//    }
//}
