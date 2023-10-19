//
//  AppConfig.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation
import SwiftUI

class Config {
    static let shared = Config()
    enum Spacing: CGFloat {
        #if iOSApp
        case xSmall = 5
        case small = 10
        case medium = 20
        case large = 30
        #elseif WidgetApp
        case xSmall = 0
        case small = 5
        case medium = 10
        case large = 15
        #endif
    }
    enum Padding {
        case padding(Edge.Set, Spacing)
    }
    let scheme = "stock://"
    let delayTime: TimeInterval = 0.1
    var screenWidth: CGFloat = UIScreen.main.bounds.size.width
    func updateScreenWidth(width: CGFloat) -> Bool {
        screenWidth = width;
        return true
    }
    enum Deeplinks {
        case sectors(selectedIndex: Int)
        case none
    }
    func deeplink(_ link: Deeplinks) -> String {
        switch link {
        case .sectors(selectedIndex: let index):
            return scheme + "sectors?" + "selected_index=\(index)"
        case .none:
            return scheme
        }
    }
}

extension View {
    func space(space: Config.Spacing) -> some View {
        self.padding(space.rawValue)
    }
    func pad(padding: Config.Padding) -> some View {
        switch padding {
        case .padding(let set, let spacing):
            return self
                .padding(set, spacing.rawValue)
        }
    }
}

extension URL {
    var deeplink: Config.Deeplinks {
        guard let queryItems = URLComponents(string: self.absoluteString)?.queryItems else {
            return .none
        }
        if self.absoluteString.contains("sectors?"),
           let selectedIndex = Int(queryItems.filter { $0.name == "selected_index" }.first?.value ?? "0") {
                return .sectors(selectedIndex: selectedIndex)
        }
        return .none
    }
}

func random(from: Int, to: Int) -> Int {
    precondition(from <= to, "Invalid range: 'from' must be less than or equal to 'to'")
    
    let range = UInt32(to - from + 1)
    return Int(arc4random_uniform(range)) + from
}

