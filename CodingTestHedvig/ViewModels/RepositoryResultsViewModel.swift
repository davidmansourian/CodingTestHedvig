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
    @Published var scrollLoadingState: InfinityScrollState = .idle
    @Published var pickedProfile: String = ""
    @Published var totalRepositories: Int = 0
    @Published var pageNumber: Int = 1
    @Published var resultsPerPage: Int = 20
    @Published var currentURL: String = ""
    
    
    
    
    func repoURLPageBuilder(URLString: String, pageNumber: Int, perPageNumber: Int) -> String{
        var components = URLComponents(string: URLString)
        
        components?.queryItems = [URLQueryItem(name: "page", value: String(pageNumber)),
                                  URLQueryItem(name: "per_page", value: String(perPageNumber))
        ]
        
        return components?.url?.absoluteString ?? ""
    }
    
    func paginateRepositoryData(URLString: String){
        // when reaching a page that does not contain any repositories, the array is simply empty. It is easy to check for it this way.
        
        // if next get request is empty, then the onAppear should not load no more
        Task{
            guard scrollLoadingState == InfinityScrollState.idle else { return }
            self.scrollLoadingState = .loading
            self.pageNumber += 1
            let url = repoURLPageBuilder(URLString: URLString, pageNumber: self.pageNumber, perPageNumber: self.resultsPerPage)
            let nextPageData = try await APIService.shared.loadRepositoryData(url: url)
            
            if nextPageData.isEmpty{
                print("nextpagedata is empty")
                self.scrollLoadingState = .finished
            } else {
                // self.scrollLoadingState = InfinityScrollState.loading -> Need bottom animation here, not complete state change
                self.totalRepositories += nextPageData.count
                for theResult in nextPageData{
                    
                    guard let imageUrl = theResult.owner?.avatarUrl else { return }
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage(), watchers: theResult.watchers ?? 0, createdAt: theResult.createdAt, updatedAt: theResult.updatedAt))
                }
                self.scrollLoadingState = .idle
                print(self.repositoryDetail.count)
            }
        
        }
        
    }
    
    
    func fillRepositoryDataModel(url: String){
        Task{
           // paginateRepositoryData(URLString: url)
            repositoryDetail.removeAll()
            self.viewState = RepositoryViewState.loading
            let searchResult = try await APIService.shared.loadRepositoryData(url: url)
            
            if searchResult.isEmpty{
                self.viewState = RepositoryViewState.isEmpty
            } else {
                self.totalRepositories = searchResult.count
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
