//
//  SearchResultViewModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import SwiftUI
import Combine

@MainActor class RepositoryResultsViewModel: ObservableObject{
    @Published var repositoryDetail: [RepositoryDetailModel] = []
    @Published var filteredRepositoryDetail: [RepositoryDetailModel] = []
    @Published var hexColorCodes: HexColorCodes?
    @Published var repoLanguages: [RepoLanguage] = []
    @Published var repoContributors: [ContributorDataModel] = []
    
    
    @Published var viewState = RepositoryViewState.loading
    @Published var scrollLoadingStateRepos: InfinityScrollStateRepos = .idle
    @Published var scrollLoadingStateContributors: InfinityScrollStateContributors = .idle
    @Published var filterBarState: RepositoryFilterBarState = .all
    
    @Published var currentURL: String = ""
    @Published var pickedProfile: String = ""
    @Published var readmeURL: String?
    @Published var currentContributorsURL: String = ""
    
    @Published var totalRepositories: Int = 0
    @Published var totalLanguagesValue: Int = 0
    @Published var totalContriubutors: Int = 0
    @Published var totalContributions: Int = 0
    
    @Published var pageNumberRepos: Int = 1
    @Published var pageNumberContributors: Int = 1
    
    @Published var resultsPerPage: Int = 20
    
    @Published var showingRepository: Bool = false
    @Published var scrollToTop: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        $filterBarState
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("DEBUG: FilterBarStatus Error (Combine) \(error)")
                }
            } receiveValue: { [weak self] filterState in
                switch filterState{
                case .all:
                    break
                case .owner:
                    print("im owner")
                    self?.filteredRepositoryDetail = self?.repositoryDetail.filter{$0.repositoryOwner.contains(self?.pickedProfile ?? "")} ?? []
                    self?.viewState = .showingResult
                case .contributor:
                    print("im contributor")
                    self?.filteredRepositoryDetail = self?.repositoryDetail.filter{!$0.repositoryOwner.contains(self?.pickedProfile ?? "")} ?? []
                    self?.viewState = .showingResult
                }
            }
            .store(in: &cancellables)
    }
    
    
    func repoURLPageBuilder(URLString: String, pageNumber: Int, perPageNumber: Int) -> String{
        var components = URLComponents(string: URLString)
        
        // ?type=all&sort=updated&affiliation=collaborator&page=2&per_page=100
        
        components?.queryItems = [URLQueryItem(name: "type", value: "all"),
                                  URLQueryItem(name: "affiliation", value: "collaborator"),
                                  URLQueryItem(name: "page", value: String(pageNumber)),
                                  URLQueryItem(name: "per_page", value: String(perPageNumber))
        ]
        
        return components?.url?.absoluteString ?? ""
    }
    
    func contributorURLPageBuilder(URLString: String, pageNumber: Int, perPageNumber: Int) -> String{
        var components = URLComponents(string: URLString)
        
        // ?type=all&sort=updated&affiliation=collaborator&page=2&per_page=100
        
        components?.queryItems = [URLQueryItem(name: "page", value: String(pageNumber)),
                                  URLQueryItem(name: "per_page", value: String(perPageNumber))
        ]
        
        return components?.url?.absoluteString ?? ""
    }
    
    func paginateRepositoryData(URLString: String){
        Task{
            guard scrollLoadingStateRepos == InfinityScrollStateRepos.idle else { return }
            self.scrollLoadingStateRepos = .loading
            self.pageNumberRepos += 1
            let url = repoURLPageBuilder(URLString: URLString, pageNumber: self.pageNumberRepos, perPageNumber: self.resultsPerPage)
            let nextPageData = try await APIService.shared.loadRepositoryData(url: url)
            
            if nextPageData.isEmpty{
                print("nextpagedata is empty")
                self.scrollLoadingStateRepos = .finished
            } else {
                // self.scrollLoadingState = InfinityScrollState.loading -> Need bottom animation here, not complete state change
                self.totalRepositories += nextPageData.count
                for theResult in nextPageData{
                    
                    guard let imageUrl = theResult.owner?.avatarUrl else { return }
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage(), watchers: theResult.watchers ?? 0, createdAt: theResult.createdAt, updatedAt: theResult.updatedAt, forks: theResult.forksCount, stars: theResult.starredCount, contributorsUrl: theResult.contributorsUrl ?? "", languagesUrl: theResult.languagesUrl, activeIssues: theResult.openIssues))
                }
                self.scrollLoadingStateRepos = .idle
                print(self.repositoryDetail.count)
            }
            
        }
        
    }
    
    func paginateContributors(URLString: String){
        Task{
            guard scrollLoadingStateContributors == InfinityScrollStateContributors.idle else { return }
            self.scrollLoadingStateContributors = .loading
            self.pageNumberContributors += 1
            let url = contributorURLPageBuilder(URLString: URLString, pageNumber: self.pageNumberContributors, perPageNumber: self.resultsPerPage)
            let nextPageData = try await APIService.shared.loadContributors(url: url)
            
            if nextPageData.isEmpty{
                print("nextpagedata is empty")
                self.scrollLoadingStateContributors = .finished
            } else {
                // self.scrollLoadingState = InfinityScrollState.loading -> Need bottom animation here, not complete state change
                self.totalContriubutors += nextPageData.count
                for theResult in nextPageData{
                    
                    let imageUrl = theResult.avatarURL
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.repoContributors.append(ContributorDataModel(username: theResult.login, image: image ?? UIImage(), contributions: theResult.contributions))
                }
                self.scrollLoadingStateContributors = .idle
            }
            
        }
        
    }
    
    func didDismiss(){
        self.showingRepository = false
    }
    
    
    func fillRepositoryDataModel(url: String){
        Task{
            // paginateRepositoryData(URLString: url)
            repositoryDetail.removeAll()
            self.viewState = .loading
            let searchResult = try await APIService.shared.loadRepositoryData(url: url)
            
            if searchResult.isEmpty{
                self.viewState = RepositoryViewState.isEmpty
            } else {
                self.totalRepositories = searchResult.count
                for theResult in searchResult{
                    guard let imageUrl = theResult.owner?.avatarUrl else { return }
                    let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                    
                    self.repositoryDetail.append(RepositoryDetailModel(repositoryTitle: theResult.name ?? "", repositoryDescription: theResult.description ?? "", repositoryOwner: theResult.owner?.login ?? "", ownerImage: image ?? UIImage(), watchers: theResult.watchers ?? 0, createdAt: theResult.createdAt, updatedAt: theResult.updatedAt, forks: theResult.forksCount, stars: theResult.starredCount, contributorsUrl: theResult.contributorsUrl ?? "", languagesUrl: theResult.languagesUrl, activeIssues: theResult.openIssues))
                }
                self.viewState = .showingResult
            }
        }
    }
    
    func loadContributors(URLString: String){
        Task{
            repoContributors.removeAll()
            let loadedContributors = try await APIService.shared.loadContributors(url: URLString)
            self.totalContriubutors = loadedContributors.count
            for contributor in loadedContributors{
                self.totalContributions += contributor.contributions
                let imageUrl = contributor.avatarURL
                let image = try await APIService.shared.downloadImage(urlString: imageUrl)
                
                self.repoContributors.append(ContributorDataModel(username: contributor.login, image: image ?? UIImage(), contributions: contributor.contributions))
            }
        }
    }
    
    
    func sortRepositories(action: SortRepository){
        self.viewState = RepositoryViewState.loading
        
        switch action{
        case .watchersDescending:
            repositoryDetail.sort{$0.watchers > $1.watchers}
            self.viewState = .showingResult
        case .watchersAscending:
            repositoryDetail.sort{$0.watchers < $1.watchers}
            self.viewState = .showingResult
        case .createdNewest:
            repositoryDetail.sort{$0.createdAt > $1.createdAt}
            self.viewState = .showingResult
        case .createdOldest:
            repositoryDetail.sort{$0.createdAt < $1.createdAt}
            self.viewState = .showingResult
        case .lastUpdated:
            repositoryDetail.sort{$0.updatedAt > $1.updatedAt}
            self.viewState = .showingResult
        case .noAction:
            self.viewState = .showingResult
        }
    }
    
    func filterRepositories(action: RepositoryFilterBarState){
        self.viewState = .loading
        switch action{
        case .all:
            print("Hej")
        case .owner:
            filteredRepositoryDetail.removeAll()
            filteredRepositoryDetail.append(contentsOf: repositoryDetail.filter{$0.repositoryOwner.contains(self.pickedProfile)})
            self.viewState = .showingResult
        case .contributor:
            filteredRepositoryDetail.removeAll()
            filteredRepositoryDetail.append(contentsOf: repositoryDetail.filter{!$0.repositoryOwner.contains(self.pickedProfile)})
            self.viewState = .showingResult
        }
    }
    
    
    
    
    func loadRepoLanguages(URLString: String){
        Task{
            self.repoLanguages.removeAll()
            self.totalLanguagesValue = 0
            self.loadColorCodes()
            let languages = try await APIService.shared.loadRepoLanguages(url: URLString)
            let languageKeys = Set(self.hexColorCodes?.keys.map { String($0) } ?? [])
            
            for language in languages{
                if let hexColorCode = self.hexColorCodes?[language.key], languageKeys.contains(language.key){
                    self.repoLanguages.append(RepoLanguage(language: language.key, color: Color(hex: hexColorCode) ?? .purple, value: language.value, percentage: nil))
                    self.totalLanguagesValue += language.value
                }
            }
            
            self.repoLanguages = self.repoLanguages.map { language in
                var languageWithPercentage = language
                let percentage = ((Double(language.value) / Double(self.totalLanguagesValue))*100)
                let roundedValue = round(percentage*100)/100.0
                languageWithPercentage.percentage = roundedValue
                print("\(languageWithPercentage.language): \(languageWithPercentage.percentage)%")
                return languageWithPercentage
            }
        }
    }
    
    func loadColorCodes(){
        guard let path = Bundle.main.path(forResource: "GitLangColors", ofType: "json") else {
            print("error path")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let colorsArray = json as? HexColorCodes {
                let colorsDict = colorsArray
                self.hexColorCodes = colorsDict
              //  print(self.hexColorCodes?.first)
            }
        } catch{
            print(error)
        }
        
    }
    
 // https://api.github.com/repos/apple/swift/readme
    
    func findReadmeURL(username: String, repoName: String){
        Task{
            let urlString = "https://api.github.com/repos/\(username)/\(repoName)/readme"
            let theReadmeURL = try await APIService.shared.getReadmeURL(url: urlString)
            if theReadmeURL == "Not Found"{
                self.readmeURL = nil
            } else {
                self.readmeURL = theReadmeURL
            }
        }
        
    }
    
}
