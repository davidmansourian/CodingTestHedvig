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
    
    
    
    func fillRepositoryDataModel(url: String){
        Task{
            repositoryDetail.removeAll()
            self.viewState = RepositoryViewState.loading
            let searchResult = try await APIService.shared.loadRepositoryData(url: url)
            
            for theResult in searchResult{
                guard let imageUrl = theResult.owner?.avatarUrl else { return }
                let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                
                self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage()))
            }
            self.viewState = RepositoryViewState.showingResult
        }
    }
    
}
