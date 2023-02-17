//
//  SingleRepositoryTextStatsView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryTextStatsView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
    }
    var body: some View {
        HStack {
            Spacer()
            Text("Created: 390 days ago")
                .font(.title2)
            .fontWeight(.light)
            Spacer()
        }
        HStack {
            Text("Updated: 33 days ago")
                .font(.title2)
            .fontWeight(.light)
            
            
        }
        HStack {
            Text("Commits: 128")
                .font(.title2)
            .fontWeight(.light)
        }
        HStack {
            Text("Active Issues: 4")
                .font(.title2)
            .fontWeight(.light)
        }
    }
}
