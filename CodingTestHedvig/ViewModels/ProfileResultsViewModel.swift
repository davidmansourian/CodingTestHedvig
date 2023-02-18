//
//  ProfileResultsViewModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import Combine
import SwiftUI


@MainActor class ProfileResultsViewModel: ObservableObject{
    @AppStorage("recentSearches") var recentSearches: [LastSearched] = []
    
    @Published var profileResults: [ProfileDetailModel] = []
    @Published var searchString: String = ""
    @Published var viewState = SearchResultViewState.noSearchString
    
    @Published var avatarImage: UIImage?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        $searchString
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global(qos: .default))
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] searchTerm in
                self?.viewState = SearchResultViewState.loading
                if searchTerm == ""{
                    self?.profileResults.removeAll()
                    self?.viewState = SearchResultViewState.noSearchString
                } else {
                    self?.profileResults.removeAll()
                    self?.fillUserDataModel(url: "https://api.github.com/search/users?q=\(searchTerm)")
                }
                
            }
            .store(in: &cancellables)
    }
    
    func checkStorageArr(){
        if recentSearches.count >= 10{
            recentSearches.popLast()
        }
    }
    
    func checkIfAlreadySearched(searchedName: String){
        let hasSearched = recentSearches.contains{ $0.username == searchedName}
        
        if hasSearched{
            removeFromSearch(username: searchedName)
            print("removed element")
        } else {
            print("didnt remove element")
        }
        
    }
    
    func removeFromSearch(username: String){
        recentSearches.removeAll{$0.username == username}
    }
   
    
    func getImageFromURL(url: String){
        Task{
            guard let image = try await APIService.shared.downloadImage(urlString: url) else { return}
            self.avatarImage = image
        }
    }
    
    
    func fillUserDataModel(url: String){
        Task{
            self.viewState = SearchResultViewState.loading
            let searchResult = try await APIService.shared.loadProfiles(url: url)
            if searchResult.totalCount == 0{
                self.viewState = SearchResultViewState.noResult
            } else {
                var counter = 1
                for theResult in searchResult.items{
                    if counter >= 21{
                        break
                    }
                    let imageUrl = theResult.avatarUrl
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.profileResults.append(ProfileDetailModel(profileUsername: theResult.login, profileAccountType: theResult.type, profileReposUrl: theResult.reposUrl, profileImage: image ?? UIImage(), profileImageURL: theResult.avatarUrl))
                    
                    counter += 1
                }
                self.viewState = SearchResultViewState.showingResult
            }
        }
    }
    
}
