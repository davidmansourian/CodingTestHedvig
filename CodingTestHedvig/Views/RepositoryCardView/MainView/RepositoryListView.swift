//
//  RepositoryListView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    
    var body: some View {
        ZStack {
            NavigationStack{
                VStack{
                    FilterBarView(repositoryResultsVm: repositoryResultsVm)
                    
                    RepositoryListStateView(repositoryResultsVm: repositoryResultsVm)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    RepositoryToolbarSortMenu(repositoryResultsVm: repositoryResultsVm)
                }
            }
            .navigationTitle("\(repositoryResultsVm.pickedProfile) - \(repositoryResultsVm.totalRepositories) related repos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
