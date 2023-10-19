//
//  StockExchangeView.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import SwiftUI
import Dependencies

public struct SectorsListView<T: SectorListViewModeling>: SectorListViewing {
    public typealias VM = T
    @ObservedObject private var viewModel: T
    @Dependency(\.viewFactory) var viewFactory: ViewFactory
    @State var selectedSector: SectorUIModel?
    var deeplinkWaitCount = 0
    public init(viewModel: T) {
        self.viewModel = viewModel
    }
    public var body: some View {
        VStack(alignment: .leading) {
            List(viewModel.sectors.indices) { i in
                sectorView(sector: viewModel.sectors[i])
            }
            .padding([.bottom], 20)
        }
//        .roundedRectangle(cornerRadius: 10, lineWidth: 0, strokeColor: .clear, fillColor: .white, showShadow: true)
    }
    func sector(for index: Int) -> SectorUIModel? {
        if viewModel.sectors.count > index {
            return viewModel.sectors[index]
        }
        return nil
    }
    
    func handleDeeplink(url: URL) {
        guard url.absoluteString.contains(Config.shared.scheme) else { return }
        
        switch url.deeplink {
        case .sectors(selectedIndex: let index):
            if let sector = self.sector(for: index) {
                selectedSector = sector
            } else {
                if deeplinkWaitCount > 3 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.handleDeeplink(url: url)
                    }
                }
            }
        case .none:
            break
        }
    }
    
    @ViewBuilder
    func sectorView(sector: SectorUIModel) -> some View {
        HStack {
            Text("Name: ")
                .appFont(.medium(isBold: true))
            Spacer()
                .frame(height: 1)
            Text(sector.name ?? "N/A")
                .appFont(.medium(isBold: true))
        }
        .onTapGesture {
            selectedSector = sector
        }
        .onOpenURL(perform: { url in
            handleDeeplink(url: url)
        })
        .sheet(item: $selectedSector) { sector in
            AnyView(
                viewFactory.makeView(
                    input: .sectorDetail(
                        sector: sector,
                        selectedDistribution: 0
                    )
                )
            )
        }
    }
}
