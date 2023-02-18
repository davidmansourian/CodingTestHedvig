//
//  LanguagesDataModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation
import SwiftUI


typealias RepoLanguages = [String: Int]
typealias HexColorCodes = [String: String]

struct RepoLanguage: Identifiable{
    let id = UUID()
    let language: String
    let color: Color
    let value: Int
    var percentage: Double?
}

