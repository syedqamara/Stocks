# Protocol Documentation

This documentation describes a set of Swift protocols designed for building flexible and modular view and view model components in applications. These protocols cover various aspects of structuring views, view models, and their interaction.

## Introduction

The protocols are divided into two sections:

1. **Basic Protocols:**
    - DataSourcing
    - ViewModel
    - ObservableViewModel
    - Viewing
    - ViewingFactory

2. **Example Use Case Protocols:**
    - StockExchangeViewing and StockExchangeViewModeling
    - SectorListViewing and SectorListViewModeling
    - SectorDetailViewing and SectorDetailViewModeling
    - DistributionCardViewing and DistributionViewModeling
    - SectorViewing and SectorViewModeling
    - StockRankInfoViewing and StockRankInfoViewModeling

These protocols provide a foundation for creating maintainable, testable, and interchangeable view and view model components in Swift applications. Below, you'll find example implementations, usage, and test case scenarios for each protocol.

## Basic Protocols

### DataSourcing

The `DataSourcing` protocol indicates a data source for a view.

```swift
public protocol DataSourcing {}
```

### ViewModel

The `ViewModel` protocol is used to define a basic view model.

```swift
public protocol ViewModel {}
```

### ObservableViewModel

The `ObservableViewModel` protocol extends `ViewModel` and allows view models to be observed for changes in their properties. It conforms to the `ObservableObject` protocol.

```swift
public protocol ObservableViewModel: ViewModel, ObservableObject {}
```

### Viewing

The `Viewing` protocol defines views with associated view models. It includes an associated type `VM` representing the view model required by the view.

```swift
public protocol Viewing: View {
    associatedtype VM: ViewModel

    init(viewModel: VM)
}
```

### ViewingFactory

The `ViewingFactory` protocol represents a factory that creates views based on a given input. It provides a generic method `makeView` to instantiate a view conforming to the `Viewing` protocol.

```swift
public protocol ViewingFactory {
    func makeView<I>(input: I) -> some Viewing
}
```

## Example Use Case Protocols

These protocols represent a real-world example of how to use the basic protocols to create a modular architecture for a financial app.

### StockExchangeViewing and StockExchangeViewModeling

The `StockExchangeViewing` protocol represents a view that displays stock exchange information, while `StockExchangeViewModeling` is the corresponding view model. The view model can manage loading state, errors, and exchange data.

```swift
// Example Implementation Code
public protocol StockExchangeViewing: Viewing where VM: StockExchangeViewModeling {}
public protocol StockExchangeViewModeling: ObservableViewModel {
    var isLoading: Bool { get set }
    var error: String? { get }
    var exchange: StockExchangeUIModel? { get set }
    init(exchange: StockExchangeUIModel?, dataSource: StockDataSourcing?)
    func reloadData()
}
```

#### Example Usage

```swift
let stockExchangeViewModel = StockExchangeViewModel(exchange: exchangeData, dataSource: stockDataSource)
let stockExchangeView = StockExchangeView(viewModel: stockExchangeViewModel)
```

#### Example Test Case

```swift
func testStockExchangeViewModel() {
    let stockExchangeViewModel = StockExchangeViewModel(exchange: exchangeData, dataSource: mockDataSource)
    stockExchangeViewModel.reloadData()
    // Assert that data is correctly loaded and handled.
}
```

### SectorListViewing and SectorListViewModeling

The `SectorListViewing` protocol represents a view displaying a list of stock sectors, while `SectorListViewModeling` is the corresponding view model that manages the sector data.

```swift
// Example Implementation Code
public protocol SectorListViewing: Viewing where VM: SectorListViewModeling {}
public protocol SectorListViewModeling: ObservableViewModel {
    var sectors: [SectorUIModel] { get set }
}
```

#### Example Usage

```swift
let sectorListViewModel = SectorListViewModel(sectors: sectorListData)
let sectorListView = SectorListView(viewModel: sectorListViewModel)
```

#### Example Test Case

```swift
func testSectorListViewModel() {
    let sectorListViewModel = SectorListViewModel(sectors: sectorListData)
    // Assert that the sector list is populated correctly.
}
```

### SectorDetailViewing and SectorDetailViewModeling

The `SectorDetailViewing` protocol represents a view displaying details of a specific stock sector, and `SectorDetailViewModeling` is the corresponding view model.

```swift
// Example Implementation Code
public protocol SectorDetailViewing: Viewing where VM: SectorDetailViewModeling {}
public protocol SectorDetailViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
}
```

#### Example Usage

```swift
let sectorDetailViewModel = SectorDetailViewModel(sector: selectedSectorData)
let sectorDetailView = SectorDetailView(viewModel: sectorDetailViewModel)
```

#### Example Test Case

```swift
func testSectorDetailViewModel() {
    let sectorDetailViewModel = SectorDetailViewModel(sector: selectedSectorData)
    // Assert that the selected sector details are displayed correctly.
}
```

### DistributionCardViewing and DistributionViewModeling

The `DistributionCardViewing` protocol represents a view displaying distribution data, and `DistributionViewModeling` is the corresponding view model.

```swift
// Example Implementation Code
public protocol DistributionCardViewing: Viewing where VM: DistributionViewModeling {}
public protocol DistributionViewModeling: ObservableViewModel {
    var distribution: DistributionUIModel? { get set }
}
```

#### Example Usage

```swift
let distributionViewModel = DistributionViewModel(distribution: assetDistributionData)
let distributionView = DistributionCardView(viewModel: distributionViewModel)
```

#### Example Test Case

```swift
func testDistributionViewModel() {
    let distributionViewModel = DistributionViewModel(distribution: assetDistributionData)
    // Assert that the asset distribution is correctly displayed.
}
```

### SectorViewing and SectorViewModeling

The `SectorViewing` protocol represents a view that displays a stock sector and allows users to select a distribution. `SectorViewModeling` is the corresponding view model.

```swift
// Example Implementation Code
public protocol SectorViewing: Viewing where VM: SectorViewModeling {}
public protocol SectorViewModeling: ObservableViewModel {
    var sector: SectorUIModel? { get set }
    var selectedDistribution: Int { get set }
}
```

#### Example Usage

```swift
let sectorViewModel = SectorViewModel(sector: selectedSectorData, selectedDistribution: 0)
let sectorView = SectorView(viewModel: sectorViewModel)
```

#### Example Test Case

```swift
func testSectorViewModel() {
    let sectorViewModel = SectorViewModel(sector: selectedSectorData, selectedDistribution: 0)
    // Assert that the sector details are displayed, and distribution is correctly selected.
}
```

### StockRankInfoViewing and StockRankInfoViewModeling

The `StockRankInfoViewing` protocol represents a view displaying daily stock ranking information, and `StockRankInfoViewModeling` is the corresponding view model.

```swift
// Example Implementation Code
public protocol StockRankInfoViewing: Viewing where VM: StockRankInfoViewModeling {}
public protocol StockRankInfoViewModeling: ObservableViewModel {
    var rank: StockRankInfoUI
