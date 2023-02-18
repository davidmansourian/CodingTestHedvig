//
//  HomeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct ProfileSearchView: View{
    @StateObject var profileResultsVm = ProfileResultsViewModel()
    @StateObject var repositoryVm = RepositoryResultsViewModel()
    
    var body: some View{
        ZStack{
            NavigationStack{
                VStack(alignment: .leading){
                    switch profileResultsVm.viewState{
                    case .noSearchString:
                        Group{
                            if profileResultsVm.recentSearches.isEmpty{
                                SearchInstructionView()
                            } else {
                                Text("Recent")
                                    .padding(.horizontal)
                                    .font(.callout)
                                RecentProfileSearchesView(profileResultsVm: profileResultsVm, repositoryResultsVm: repositoryVm)
                                    .onAppear{
                                        print("im here")
                                    }
                            }
                        }
                        .navigationTitle("Git Finder")
                        .navigationBarTitleDisplayMode(.inline)
                    case .loading:
                        LoadingIndicatorView()
                    case .noResult:
                        NoResultView()
                    case .showingResult:
                        ScrollView(.vertical, showsIndicators: true){
                            ForEach(profileResultsVm.profileResults){ theResult in
                                NavigationLink(destination: RepositoryListView(repositoryResultsVm: repositoryVm)){
                                    ProfileCardView(profileResultsVm: profileResultsVm, image: theResult.profileImage, username: theResult.profileUsername, type: theResult.profileAccountType)
                                }
                                .animation(.default, value: profileResultsVm.searchString)
                                .tint(.primary)
                                .simultaneousGesture(TapGesture().onEnded({
                                    profileResultsVm.checkIfAlreadySearched(searchedName: theResult.profileUsername)
                                    profileResultsVm.checkStorageArr()
                                    profileResultsVm.recentSearches.append(LastSearched(avatar: theResult.profileImage, username: theResult.profileUsername, repoUrl: theResult.profileReposUrl))
                                    repositoryVm.filterBarState = .all
                                    repositoryVm.currentURL = theResult.profileReposUrl
                                    repositoryVm.pageNumberRepos = 1 // resetting page number
                                    repositoryVm.fillRepositoryDataModel(url: repositoryVm.repoURLPageBuilder(URLString: theResult.profileReposUrl, pageNumber: repositoryVm.pageNumberRepos, perPageNumber: repositoryVm.resultsPerPage))
                                    repositoryVm.pickedProfile = theResult.profileUsername
                                }))
                                
                            }
                        }
                    }
                }
            }
            .searchable(text: $profileResultsVm.searchString).autocorrectionDisabled()
            .scrollDismissesKeyboard(.immediately)
        }
    }
}
