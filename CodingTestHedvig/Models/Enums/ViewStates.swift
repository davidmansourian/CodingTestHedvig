//
//  ViewStates.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation


enum SearchResultViewState{
    case noSearchString, loading, noResult, showingResult // mifght not need
}

enum RepositoryViewState{
    case loading, isEmpty, showingResult
}

enum ContributorsViewState{
    case loading, showingResult
}
