//
//  RepositoryListStateView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryListStateView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        switch repositoryResultsVm.viewState{
        case .loading:
            LoadingIndicatorView()
        case .isEmpty:
            NoRepositoriesView()
        case .showingResult:
            List{
                RepositoryFilterStateView(repositoryResultsVm: repositoryResultsVm)
                
                RepositoryScrollLoadingStateView(repositoryResultsVm: repositoryResultsVm)
            }
            .listStyle(.inset)
            
        }
        
    }
}
