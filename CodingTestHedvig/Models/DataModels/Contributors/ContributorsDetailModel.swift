//
//  ContributorsModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation

struct ContributorElement: Decodable {
    let login: String
    let avatarURL: String
    let contributions: Int

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case contributions
    }
}

