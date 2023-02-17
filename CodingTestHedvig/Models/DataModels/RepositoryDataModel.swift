//
//  UserResultModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation

// Serach result show repos by user, as well as repos that
// the user has contributed in

// When initial implementations have been added, I want to add some
// additional functionalities:
// - Besides collaborators and languages, show
// Total issues and number of issues closed v. opened
// - tags
// - number of commits
// - last commit
// potential to clone (git & ssh urls)


struct Welcome3Element: Decodable{
    let id: Int
    let name: String?
    let fullName: String?
    let isPrivate: Bool?
    let owner: Owner?
    let repoUrl: String?
    let description: String?
    let contributorsUrl: String?
    let hasIssues: Bool?
    let hasWiki: Bool?
    let issueCount: Int?
    let watchers: Int?
    let createdAt: String
    let updatedAt: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case owner
        case repoUrl = "url"
        case description
        case contributorsUrl = "contributors_url"
        case hasIssues = "has_issues"
        case hasWiki = "has_wiki"
        case issueCount = "open_issues_count"
        case watchers
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        
    
    }
}

struct Owner: Decodable{
    let login: String
    let id: Int
    let avatarUrl: String
    let reposUrl: String
    let type: String
    
    enum CodingKeys: String, CodingKey{
        case login
        case id
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case type
    }
}

typealias RepositoryResults = [Welcome3Element]
