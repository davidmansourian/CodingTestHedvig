//
//  RepositoryWatchersView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryWatchersView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var watchers: Int
    
    init(searchResultVm: RepositoryResultsViewModel, watchers: Int){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _watchers = State(wrappedValue: watchers)
    }
    var body: some View {
        Image(systemName: "eye")
            .font(.caption)
            .fontWeight(.ultraLight)
            .opacity(0.2)
            .padding(.bottom, 3)
        
        Text("\(watchers) watchers")
            .font(.caption)
            .fontWeight(.ultraLight)
            .padding(.bottom, 3)
    }
}
