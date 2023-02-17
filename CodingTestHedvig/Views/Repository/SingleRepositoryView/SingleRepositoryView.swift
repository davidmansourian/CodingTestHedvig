//
//  SingleRepositoryView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryView: View {
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
        VStack(alignment: .leading){
            HStack{
                SingleRepositoryTitleView(repositoryResultsVm: repositoryResultsVm, title: title)
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
            
            HStack(alignment: .top){
                
                VStack{
                    
                    SingleRepositoryContributorsView(repositoryResultsVm: repositoryResultsVm, title: title)
                }
                
                VStack{
                    SingleRepositoryLanguagesView(repositoryResultsVm: repositoryResultsVm, title: title)
                }
                
                VStack{
                    SingleRepositoryReadmeView(repositoryResultsVm: repositoryResultsVm, title: title)
                }


            }
            .frame(maxWidth: .infinity)

            
           /* VStack(spacing: 20){
                SingleRepositoryTextStatsView(repositoryResultsVm: repositoryResultsVm, title: title)
            }
            .padding()*/
            
            Spacer()
            
        }
    }
}
