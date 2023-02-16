//
//  SearchResultViewModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import Combine
import SwiftUI

@MainActor class SearchResultViewModel: ObservableObject{
    @Published var repositoryDetail: [RepositoryDetailModel] = []
    @Published var searchString: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        $searchString
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global(qos: .default))
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] searchTerm in
                if searchTerm == ""{
                    self?.repositoryDetail.removeAll()
                } else {
                    self?.loadRepositoryModel(url: "https://api.github.com/users/\(searchTerm)/repos")
                }
                
            }
            .store(in: &cancellables)
    }
    
    
    
    func loadRepositoryModel(url: String){
        Task{
            let searchResult = await APILoader.shared.loadData(url: url)
            
            for theResult in searchResult{
                guard let imageUrl = theResult.owner?.avatarUrl else { return }
                let image = try await APILoader.shared.downloadImage(urlString: imageUrl)
                
                self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage()))
            }
        }
    }
    
}
