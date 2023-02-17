//
//  SearchResultViewModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import SwiftUI

@MainActor class RepositoryResultsViewModel: ObservableObject{
    @Published var repositoryDetail: [RepositoryDetailModel] = []
    @Published var viewState = RepositoryViewState.loading
    @Published var pickedProfile: String = ""
    
    
    
    func fillRepositoryDataModel(url: String){
        Task{
            repositoryDetail.removeAll()
            self.viewState = RepositoryViewState.loading
            let searchResult = try await APIService.shared.loadRepositoryData(url: url)
            
            if searchResult.isEmpty{
                self.viewState = RepositoryViewState.isEmpty
            } else {
                for theResult in searchResult{
                    guard let imageUrl = theResult.owner?.avatarUrl else { return }
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage(), watchers: theResult.watchers ?? 0, createdAt: theResult.createdAt, updatedAt: theResult.updatedAt))
                }
                self.viewState = RepositoryViewState.showingResult
            }
        }
    }
    
    func sortRepositories(action: SortRepository){
        self.viewState = RepositoryViewState.loading
        
        switch action{
        case .watchersDescending:
            repositoryDetail.sort{$0.watchers > $1.watchers}
            self.viewState = RepositoryViewState.showingResult
        case .watchersAscending:
            repositoryDetail.sort{$0.watchers < $1.watchers}
            self.viewState = RepositoryViewState.showingResult
        case .createdNewest:
            repositoryDetail.sort{$0.createdAt > $1.createdAt}
            self.viewState = RepositoryViewState.showingResult
        case .createdOldest:
            repositoryDetail.sort{$0.createdAt < $1.createdAt}
            self.viewState = RepositoryViewState.showingResult
        case .lastUpdated:
            repositoryDetail.sort{$0.updatedAt > $1.updatedAt}
            self.viewState = RepositoryViewState.showingResult
        case .noAction:
            self.viewState = RepositoryViewState.showingResult
        }
    }
    
}
