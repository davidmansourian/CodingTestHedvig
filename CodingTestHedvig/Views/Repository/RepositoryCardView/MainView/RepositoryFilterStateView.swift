//
//  RepositoryFilterStateView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryFilterStateView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        
        repositoryResultsVm.filterBarState == .owner || repositoryResultsVm.filterBarState == .contributor ?
        
            ForEach(repositoryResultsVm.filteredRepositoryDetail){ theResult in
                RepositoryCardView(repositoryResultsVm: repositoryResultsVm, image: theResult.ownerImage, title: theResult.repositoryTitle, description: theResult.repositoryDescription, owner: theResult.repositoryOwner, watchers: theResult.watchers, stars: theResult.stars, forks: theResult.forks, contributorsUrl: theResult.contributorsUrl, languagesUrl: theResult.languagesUrl, activeIssues: theResult.activeIssues)}
        
        :
        
            ForEach(repositoryResultsVm.repositoryDetail){ theResult in
                RepositoryCardView(repositoryResultsVm: repositoryResultsVm, image: theResult.ownerImage, title: theResult.repositoryTitle, description: theResult.repositoryDescription, owner: theResult.repositoryOwner, watchers: theResult.watchers, stars: theResult.stars, forks: theResult.forks, contributorsUrl: theResult.contributorsUrl, languagesUrl: theResult.languagesUrl, activeIssues: theResult.activeIssues)}
    }
}
