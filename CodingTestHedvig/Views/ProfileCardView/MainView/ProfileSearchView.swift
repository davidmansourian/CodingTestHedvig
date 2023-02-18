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
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        switch profileResultsVm.viewState{
                        case .noSearchString:
                            SearchInstructionView()
                                .offset(y: 50)
                                .navigationTitle("Git Finder")
                                .navigationBarTitleDisplayMode(.large)
                        case .loading:
                            LoadingIndicatorView()
                              .offset(y: 50)
                        case .noResult:
                            NoResultView()
                               .offset(y: 50)
                        case .showingResult:
                            ForEach(profileResultsVm.profileResults){ theResult in
                                NavigationLink(destination: RepositoryListView(repositoryResultsVm: repositoryVm)){
                                    ProfileCardView(profileResultsVm: profileResultsVm, image: theResult.profileImage, username: theResult.profileUsername, type: theResult.profileAccountType)
                                }
                                .animation(.default, value: profileResultsVm.searchString)
                                .tint(.primary)
                                .simultaneousGesture(TapGesture().onEnded({
                                    repositoryVm.filterBarState = .all
                                    repositoryVm.currentURL = theResult.profileReposUrl
                                    repositoryVm.pageNumber = 1 // resetting page number
                                    repositoryVm.fillRepositoryDataModel(url: repositoryVm.repoURLPageBuilder(URLString: theResult.profileReposUrl, pageNumber: repositoryVm.pageNumber, perPageNumber: repositoryVm.resultsPerPage))
                                    repositoryVm.pickedProfile = theResult.profileUsername
                                }))
                              Divider()
                                
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
