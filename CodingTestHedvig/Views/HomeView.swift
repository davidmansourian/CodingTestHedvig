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
        List(searchResultVm.repositoryDetail){ theResult in
            Image(uiImage: theResult.ownerImage)
        }
        .onAppear{
            searchResultVm.loadRepositoryModel(url: "https://api.github.com/users/sada20ig/repos")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
