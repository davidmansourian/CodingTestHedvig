//
//  RepositoryListView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    
    var body: some View {
        ZStack {
            NavigationStack{
                    VStack{
                        switch repositoryResultsVm.viewState{
                        case .loading:
                            LoadingIndicatorView()
                              //  .offset(y:50)
                        case .isEmpty:
                            NoRepositoriesView()
                              //  .offset(y: 200)
                        case .showingResult:
                            List{
                                ForEach(repositoryResultsVm.repositoryDetail){ theResult in
                                    RepositoryCardView(searchResultVm: repositoryResultsVm, image: theResult.ownerImage, title: theResult.repositoryTitle, description: theResult.repositoryDescription, owner: theResult.repositoryOwner, watchers: theResult.watchers)
                                }
                                switch repositoryResultsVm.scrollLoadingState{
                                case .idle:
                                    Color.clear
                                        .frame(width: 100, height: 100)
                                        .onAppear{
                                            repositoryResultsVm.paginateRepositoryData(URLString: repositoryResultsVm.currentURL)
                                        }
                                case .loading:
                                    LoadingIndicatorView()
                                        .frame(maxWidth: .infinity)
                                    
                                case .finished:
                                    EmptyView()
                                }
                                
                              /*  switch repositoryResultsVm.scrollLoadingState{
                                case .idle:
                                    Color.clear
                                        .frame(width: 100, height: 100)
                                        .onAppear{
                                            print("im idle")
                                        }
                                case .loading:
                                    HStack{
                                        Spacer()
                                        LoadingIndicatorView()
                                        Spacer()
                                    }
                                    .onAppear{
                                        repositoryResultsVm.paginateRepositoryData(URLString: repositoryResultsVm.currentURL)
                                        print("im loading")
                                    }
                                case .finished:
                                    Color.clear
                                        .frame(width: 0, height: 0)
                                }*/
                            }
                            .listStyle(.inset)

                        }
                        
                    }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    RepositoryToolbarSortMenu(repositoryResultsVm: repositoryResultsVm)
                }
            }
            .navigationTitle("\(repositoryResultsVm.pickedProfile) - \(repositoryResultsVm.totalRepositories) related repos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
