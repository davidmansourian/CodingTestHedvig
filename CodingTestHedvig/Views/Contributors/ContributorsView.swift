//
//  ContributorsView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct ContributorsView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        NavigationStack{
            VStack{
                Text("\(repositoryResultsVm.totalContriubutors) contributors")
                    .font(.title)
                    .fontWeight(.light)
                    .padding()
                List{
                    ForEach(repositoryResultsVm.repoContributors){ contributor in
                        ContributorRowView(repositoryResultsVm: repositoryResultsVm, username: contributor.username, image: contributor.image, contributions: contributor.contributions)
                    }
                }
                .listStyle(.inset)
                
            }
        }
    }
}
