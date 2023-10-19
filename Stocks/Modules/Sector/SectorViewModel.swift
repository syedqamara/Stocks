//
//  SectorViewModel.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation

public class SectorViewModel: SectorViewModeling {
    @Published public var selectedDistribution: Int = 0
    @Published public var sector: SectorUIModel?
    public init(sector: SectorUIModel?, selectedDistribution: Int) {
        if let count = sector?.distributions?.count, selectedDistribution >= count {
            self.selectedDistribution = count - 1
        } else {
            self.selectedDistribution = selectedDistribution
        }
        self.sector = sector
    }
}
