//
//  FilterBarState.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation

enum RepositoryFilterBarState: Int, CaseIterable{
    case all
    case owner
    case contributor
    
    var title: String{
        switch self{
        case .all: return "All Repos"
        case .owner: return "Owned"
        case .contributor: return "Contributor"
        }
    }
}
