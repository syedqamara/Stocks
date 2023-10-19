//
//  FileReader.swift
//  Stocks
//
//  Created by Apple on 18/10/2023.
//

import Foundation

class FileReader {
    static func load<T: Codable>(_ filename: String, fileExtension: String, as type: T.Type) -> T? {
        if let path = Bundle.main.path(forResource: filename, ofType: fileExtension) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                print("Error loading and decoding file: \(error)")
            }
        }
        return nil
    }
}
