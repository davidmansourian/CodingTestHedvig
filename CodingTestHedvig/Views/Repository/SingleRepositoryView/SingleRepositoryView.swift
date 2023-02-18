//
//  SingleRepositoryView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var itemHovered: Bool = false
    @State var image = UIImage()
    @State var title: String
    @State var description: String
    @State var owner: String
    @State var watchers: Int
    @State var stars: Int
    @State var forks: Int
    @State var contributorsUrl: String
    @State var languagesUrl: String
    @State var activeIssues: Int
    
    
    init(repositoryResultsVm: RepositoryResultsViewModel, image: UIImage, title: String, description: String, owner: String, watchers: Int, stars: Int, forks: Int, contributorsUrl: String, languagesUrl: String, activeIssues: Int){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _image = State(wrappedValue: image)
        _title = State(wrappedValue: title)
        _description = State(wrappedValue: description)
        _owner = State(wrappedValue: owner)
        _watchers = State(wrappedValue: watchers)
        _stars = State(wrappedValue: stars)
        _forks = State(wrappedValue: forks)
        _contributorsUrl = State(wrappedValue: contributorsUrl)
        _languagesUrl = State(wrappedValue: languagesUrl)
        _activeIssues = State(wrappedValue: activeIssues)
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    SingleRepositoryTitleView(repositoryResultsVm: repositoryResultsVm, title: title)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.primary)
                            .font(.title)
                            .fontWeight(.light)
                    }
                    .padding(.top)
                    .padding(.trailing)
                }
                
                HStack{
                    SingleRepositoryOwnerView(repositoryResultsVm: repositoryResultsVm, owner: owner, image: image)
                }
                .offset(y: -5)
                
                HStack{
                    SingleRepositoryDescriptionView(repositoryResultsVm: repositoryResultsVm, description: description)
                    
                    SingleRepositoryStatsView(repositoryResultsVm: repositoryResultsVm, watchers: watchers, stars: stars, forks: forks)
                }
                
                .padding(.trailing)
                
                VStack{
                    SingleRepositoryLanguagesView(repositoryResultsVm: repositoryResultsVm, languagesUrl: languagesUrl)
                }
                
                HStack(alignment: .top, spacing: 40){
                    
                    VStack{
                        
                        SingleRepositoryContributorsView(repositoryResultsVm: repositoryResultsVm, title: title, image: image, contributorsURL: contributorsUrl)
                    }
                    
                    if repositoryResultsVm.readmeURL != nil{
                        VStack{
                            SingleRepositoryReadmeView(repositoryResultsVm: repositoryResultsVm, owner: owner, title: title)
                        }
                        .offset(y: 1)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
            .onAppear{
                repositoryResultsVm.totalContributions = 0
                repositoryResultsVm.pageNumberContributors = 1
                repositoryResultsVm.totalContriubutors = 0
                repositoryResultsVm.currentContributorsURL = contributorsUrl
                let builtURL = repositoryResultsVm.contributorURLPageBuilder(URLString: contributorsUrl, pageNumber: repositoryResultsVm.pageNumberContributors, perPageNumber: repositoryResultsVm.resultsPerPage)
                repositoryResultsVm.loadContributors(URLString: builtURL)
                repositoryResultsVm.findReadmeURL(username: owner, repoName: title)
            }
        }
    }
}
