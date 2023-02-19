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
                switch repositoryResultsVm.contributorsViewState{
                case .loading:
                switch repositoryResultsVm.APIResponseState{
                case .good:
                    LoadingIndicatorView()
                case .fail:
                    Text("Error loading")
                        .alert(repositoryResultsVm.APIErrorResponse?.message ?? "Error", isPresented: $repositoryResultsVm.showingAlert) {
                            Button("OK", role: .cancel) {
                                repositoryResultsVm.showingAlert = false
                            }
                        }
                }
                case .showingResult:
                    Text(
                        repositoryResultsVm.totalContriubutors == 1 ? "\(repositoryResultsVm.totalContributions) contributions by \(repositoryResultsVm.totalContriubutors) contributor" : "\(repositoryResultsVm.totalContributions) contributions by \(repositoryResultsVm.totalContriubutors) contributors")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding()
                        .foregroundColor(.primary)
                    Divider()
                        .offset(y: -5)
                    List{
                        Group{
                            ForEach(repositoryResultsVm.repoContributors){ contributor in
                                ContributorRowView(repositoryResultsVm: repositoryResultsVm, username: contributor.username, image: contributor.image, contributions: contributor.contributions)
                            }
                            
                            ContributorsScrollLoadingStateView(repositoryResultsVm: repositoryResultsVm)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                }
            }
        }
    }
}
