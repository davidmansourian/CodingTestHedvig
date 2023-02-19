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
            switch repositoryResultsVm.APIResponseState{
            case .good:
                LoadingIndicatorView()
            case .fail:
                NoRepositoriesView()
                    .alert(repositoryResultsVm.APIErrorResponse?.message ?? "Error", isPresented: $repositoryResultsVm.showingAlert) {
                        Button("OK", role: .cancel) {
                            repositoryResultsVm.showingAlert = false
                        }
                    }
            }
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
