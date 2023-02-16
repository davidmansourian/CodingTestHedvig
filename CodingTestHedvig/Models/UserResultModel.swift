//
//  UserResultModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation

struct UserResultModel: Decodable{
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
}

struct Item: Decodable{
    let login: String
    let id: Int
    let avatarURL: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let score: Double
}
