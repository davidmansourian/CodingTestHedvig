//
//  SavedSearch.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import Foundation
import SwiftUI

struct LastSearched: Identifiable, Codable{
    var id = UUID()
    var username: String
    var avatar: Data
    var repoURL: String
    
    // Source for solution https://stackoverflow.com/a/55211025/18421792
    public init(avatar: UIImage, username: String, repoUrl: String) {
        self.avatar = avatar.pngData()!
        self.username = username
        self.repoURL = repoUrl
    }
}
