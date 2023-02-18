//
//  ArrayExtension.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import Foundation
import SwiftUI


// Source https://stackoverflow.com/questions/72727763/what-is-the-correct-way-to-add-new-element-to-appstorage-stored-array
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
