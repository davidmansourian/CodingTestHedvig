//
//  APIMaxedOutModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-19.
//

import Foundation


struct APIMaxedOutModel: Codable {
    let message: String
    let documentationURL: String

    enum CodingKeys: String, CodingKey {
        case message
        case documentationURL = "documentation_url"
    }
}
