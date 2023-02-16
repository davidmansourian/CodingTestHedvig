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
            Color.white // Change color
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        switch repositoryResultsVm.viewState{
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
        }
    }
}
