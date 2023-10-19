//
//  Architecture.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI

/// Protocol to indicate a data source for a view.
public protocol DataSourcing {}

/// Protocol to define a view model.
public protocol ViewModel { }

/// Protocol for view models that can be observed for changes in their properties.
public protocol ObservableViewModel: ViewModel, ObservableObject { }

/// Protocol for views, with an associated view model type.
public protocol Viewing: View {
    /// The associated view model type that this view requires.
    associatedtype VM: ViewModel

    /// Initializes the view with a given view model.
    ///
    /// - Parameter viewModel: The view model to bind to the view.
    init(viewModel: VM)
}

/// Protocol for a factory that creates views.
public protocol ViewingFactory {
    /// Creates a view of a specific type for a given input.
    ///
    /// - Parameter input: The input data for configuring the view.
    /// - Returns: An instance of a view that conforms to the `Viewing` protocol.
    func makeView<I>(input: I) -> any Viewing
}

