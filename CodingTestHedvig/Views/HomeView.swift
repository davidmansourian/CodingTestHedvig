//
//  HomeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct HomeView: View {
    //@StateObject var apiLoader = APILoader()
    @StateObject var searchResultVm = SearchResultViewModel()
    var body: some View {
        ZStack {
            Color.white // Change color
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        ForEach(searchResultVm.repositoryDetail){ theResult in
                            SearchResultCardView(searchResultVm: searchResultVm, image: theResult.ownerImage, title: theResult.repositoryTitle, description: theResult.repositoryDescription, owner: theResult.repositoryOwner)
                            
                            Divider()
                            // Need to develop a way that when
                            // a user does not exist, the
                            // searchstring matches the best matching name
                            // This means that I probably have to
                            // use the user search first in order to grab
                            // a repo link from there
                            // To sum it up, the search function
                            // has to be more advanced
                            // and cannot simply
                            // search for 1:1 usernames
                        }

                    }
                   /* .onAppear{
                        searchResultVm.loadRepositoryModel(url: "https://api.github.com/users/davidmansourian/repos")
                    }*/
                }
            }
            .searchable(text: $searchResultVm.searchString).autocorrectionDisabled()
            .scrollDismissesKeyboard(.immediately)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
