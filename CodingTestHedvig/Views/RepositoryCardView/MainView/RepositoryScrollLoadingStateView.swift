//
//  RepositoryScrollLoadingStateView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryScrollLoadingStateView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        switch repositoryResultsVm.scrollLoadingState{
        case .idle:
            Color.clear
                .frame(width: 100, height: 100)
                .onAppear{
                    repositoryResultsVm.paginateRepositoryData(URLString: repositoryResultsVm.currentURL)
                }
        case .loading:
            LoadingIndicatorView()
                .frame(maxWidth: .infinity)
            
        case .finished:
            EmptyView()
        }
    }
}
