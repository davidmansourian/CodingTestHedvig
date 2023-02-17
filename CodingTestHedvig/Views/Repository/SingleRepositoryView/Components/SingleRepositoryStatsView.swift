//
//  SingleRepositoryStatsView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryStatsView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var watchers: Int
    @State var stars: Int
    @State var forks: Int
    
    init(repositoryResultsVm: RepositoryResultsViewModel, watchers: Int, stars: Int, forks: Int){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _watchers = State(wrappedValue: watchers)
        _stars = State(wrappedValue: stars)
        _forks = State(wrappedValue: forks)
    }
    var body: some View {
        Image(systemName: "eye")
            .font(.caption)
            .fontWeight(.light)
        
        Text("\(watchers)")
            .font(.caption)
            .fontWeight(.light)
        
        Image(systemName: "star")
            .font(.caption)
            .fontWeight(.light)
        
        Text("\(stars)")
            .font(.caption)
            .fontWeight(.light)
        
        Image(systemName: "tuningfork")
            .font(.caption)
            .fontWeight(.light)
        
        Text("\(forks)")
            .font(.caption)
            .fontWeight(.light)
    }
}
