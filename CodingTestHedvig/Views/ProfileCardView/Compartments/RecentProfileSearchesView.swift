//
//  RecentProfileSearchesView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct RecentProfileSearchesView: View {
    @StateObject var profileResultsVm: ProfileResultsViewModel
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State private var isPressed: Bool = false
    
    init(profileResultsVm: ProfileResultsViewModel, repositoryResultsVm: RepositoryResultsViewModel){
        _profileResultsVm = StateObject(wrappedValue: profileResultsVm)
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        List{
            ForEach(profileResultsVm.recentSearches.reversed()){ recentSearches in
                Button {
                    isPressed.toggle()
                    profileResultsVm.checkIfAlreadySearched(searchedName: recentSearches.username)
                    profileResultsVm.checkStorageArr()
                    profileResultsVm.recentSearches.append(LastSearched(avatar: UIImage(data: recentSearches.avatar)!, username: recentSearches.username, repoUrl: recentSearches.repoURL))
                    repositoryResultsVm.filterBarState = .all
                    repositoryResultsVm.currentURL = recentSearches.repoURL
                    repositoryResultsVm.pageNumberRepos = 1 // resetting page number
                    repositoryResultsVm.fillRepositoryDataModel(url: repositoryResultsVm.repoURLPageBuilder(URLString: recentSearches.repoURL, pageNumber: repositoryResultsVm.pageNumberRepos, perPageNumber: repositoryResultsVm.resultsPerPage))
                    repositoryResultsVm.pickedProfile = recentSearches.username
                    repositoryResultsVm.scrollLoadingStateRepos = .idle
                } label: {
                    HStack{
                        ProfileAvatarView(profileResultsVm: profileResultsVm, image: UIImage(data: recentSearches.avatar)!)
                        
                        ProfileUsernameView(profileResultsVm: profileResultsVm, username: recentSearches.username)
                        
                        Spacer()
                        Button {
                            profileResultsVm.removeFromSearch(username: recentSearches.username)
                        } label: {
                            Text("x")
                                .font(.subheadline)
                                .fontWeight(.ultraLight)
                                .padding(.trailing)
                                .foregroundColor(.primary)
                        }
                        .navigationDestination(isPresented: $isPressed) {
                            RepositoryListView(repositoryResultsVm: repositoryResultsVm)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.inset)
    }
}
