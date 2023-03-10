//
//  RepositoryDetailModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import SwiftUI

struct RepositoryDetailModel: Identifiable{
    let id = UUID()
    let repositoryTitle: String
    let repositoryDescription: String
    let repositoryOwner: String
    let ownerImage: UIImage
    let watchers: Int
    let createdAt: String
    let updatedAt: String
    let forks: Int
    let stars: Int
    let contributorsUrl: String
    let languagesUrl: String
    let activeIssues: Int
}
