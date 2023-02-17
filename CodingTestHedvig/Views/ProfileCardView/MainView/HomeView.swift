//
//  HomeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct HomeView: View{
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
                        case .loading:
                            LoadingIndicatorView()
                                .offset(y: 50)
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

/*struct HomeView: View {
    @StateObject var repositoryResultsVm = RepositoryResultsViewModel()
    var body: some View {
        ZStack {
            Color.white // Change color
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        switch repositoryResultsVm.viewState{
                        case .noSearchString:
                            SearchInstructionView()
                                .offset(y: 200)
                        case .loading:
                            LoadingIndicatorView()
                                .offset(y:50)
                        case .showingResult:
                            ForEach(repositoryResultsVm.repositoryDetail){ theResult in
                                RepositoryCardView(searchResultVm: repositoryResultsVm, image: theResult.ownerImage, title: theResult.repositoryTitle, description: theResult.repositoryDescription, owner: theResult.repositoryOwner)
                                
                                Divider()
                            }
                        }
                        
                    }
                }
            }
            .searchable(text: $repositoryResultsVm.searchString).autocorrectionDisabled()
            .scrollDismissesKeyboard(.immediately)
        }
    }
}*/
