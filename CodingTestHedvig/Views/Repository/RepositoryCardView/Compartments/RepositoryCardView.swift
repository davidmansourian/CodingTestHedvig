//
//  SearchResultCardView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryCardView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
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
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 4){
                
                HStack(spacing: 20){
                    RepositoryTitleView(searchResultVm: repositoryResultsVm, title: title)
                    
                    Spacer()
                    
                    ViewRepositoryButtonView(repositoryResultsVm: repositoryResultsVm, image: image, title: title, description: description, owner: owner, watchers: watchers, stars: stars, forks: forks, contributorsUrl: contributorsUrl, languagesUrl: languagesUrl, activeIssues: activeIssues)
                }
               // .padding(.top, 3)
                
                RepositoryDescriptionView(searchResultVm: repositoryResultsVm, description: description)
            }
           // .padding(.horizontal)
            
            HStack{
                RepositoryProfileAvatarView(searchResultVm: repositoryResultsVm, image: image)
                
                    RepositoryOwnerView(searchResultVm: repositoryResultsVm, owner: owner)
                    
                Spacer()
                
                RepositoryWatchersView(searchResultVm: repositoryResultsVm, watchers: watchers)
            }
          //  .padding(.horizontal)
            
            HStack{
                if owner != repositoryResultsVm.pickedProfile{
                    Text("\(repositoryResultsVm.pickedProfile) is a contributor")
                        .foregroundColor(.blue)
                        .font(.caption2)
                        .fontWeight(.light)
                }
            }
          //  .padding(.horizontal)
        }
        
    }
}
