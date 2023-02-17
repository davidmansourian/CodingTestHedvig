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
                                .offset(y: 200)
                                .navigationTitle("Git Finder")
                                .navigationBarTitleDisplayMode(.large)
                        case .loading:
                            LoadingIndicatorView()
                                .offset(y: 50)
                        case .noResult:
                            NoResultView()
                                .offset(y: 200)
                        case .showingResult:
                            ForEach(profileResultsVm.profileResults){ theResult in
                                NavigationLink {
                                   RepositoryListView(repositoryResultsVm: repositoryVm)
                                } label: {
                                    ProfileCardView(profileResultsVm: profileResultsVm, image: theResult.profileImage, username: theResult.profileUsername, type: theResult.profileAccountType)
                                }
                                .simultaneousGesture(TapGesture().onEnded({
                                    repositoryVm.fillRepositoryDataModel(url: theResult.profileReposUrl)
                                    repositoryVm.pickedProfile = theResult.profileUsername
                                }))
                                .tint(Color.black)

                                
                                Divider()
                                
                            }
                            .animation(.default, value: profileResultsVm.searchString)
                        }
                    }
                }
            }
            .searchable(text: $profileResultsVm.searchString).autocorrectionDisabled()
            .scrollDismissesKeyboard(.immediately)
        }
    }
}
