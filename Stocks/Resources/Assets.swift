//
//  Assets.swift
//  Stocks
//
//  Created by Apple on 17/10/2023.
//

import Foundation
import SwiftUI

public struct Assets {
    public enum Image: String {
        case brandLogo = "brand_logo"
        case pencil = "pencil"
        case graphUp = "graph_up"
        case graphDown = "graph_down"
    }
    public enum Color: String {
        case lightGrey = "light_grey"
        case darkGreen = "dark_green"
    }
}

extension Image {
    init(image: Assets.Image) {
        self.init(image.rawValue)
    }
}

extension Color {
    public init(color: Assets.Color) {
        self.init(color.rawValue)
    }
    public init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
