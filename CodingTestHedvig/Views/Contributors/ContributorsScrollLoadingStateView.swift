//
//  ContributorsScrollLoadingStateView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct ContributorsScrollLoadingStateView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        switch repositoryResultsVm.scrollLoadingStateContributors{
        case .idle:
            Color.clear
                .frame(width: 100, height: 100)
                .onAppear{
                    repositoryResultsVm.paginateContributors(URLString: repositoryResultsVm.currentContributorsURL)
                }
        case .loading:
            LoadingIndicatorView()
                .frame(maxWidth: .infinity)
            
        case .finished:
            EmptyView()
        }
    }
}
