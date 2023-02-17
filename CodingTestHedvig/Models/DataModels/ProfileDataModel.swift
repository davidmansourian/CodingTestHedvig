//
//  ProfileDataModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation

struct ProfileDataModel: Decodable{
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Items]
    
    enum CodingKeys: String, CodingKey{
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Items: Decodable{
    let login: String
    let avatarUrl: String
    let profileUrl: String
    let reposUrl: String
    let type: String // User or organization
    
    enum CodingKeys: String, CodingKey{
        case login
        case avatarUrl = "avatar_url"
        case profileUrl = "url"
        case reposUrl = "repos_url"
        case type
    }
}
