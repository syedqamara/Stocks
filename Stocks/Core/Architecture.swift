//
//  Architecture.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI

public protocol DataSourcing {}
public protocol ViewModel { }
public protocol ObservableViewModel: ViewModel, ObservableObject { }
public protocol Viewing: View {
    associatedtype VM: ViewModel
    init(viewModel: VM)
}


public protocol ViewingFactory {
    func makeView<I>(input: I) -> any Viewing
}
