//
//  Extensions.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

extension Encodable {
    public func toJSONString(prettyPrinted: Bool = true) -> String? {
        let encoder = JSONEncoder()
        if prettyPrinted {
            encoder.outputFormatting = .prettyPrinted
        }

        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error converting to JSON string: \(error)")
            return nil
        }
    }
}
