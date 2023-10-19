//
//  DistributionCardViewModel.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import Combine




class DistributionViewModel: DistributionViewModeling {
    @Published var distribution: DistributionUIModel? = nil
    
    init(distribution: DistributionUIModel?) {
        self.distribution = distribution
    }
}
