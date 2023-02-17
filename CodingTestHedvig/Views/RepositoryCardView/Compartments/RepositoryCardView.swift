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
    
    init(searchResultVm: RepositoryResultsViewModel, image: UIImage, title: String, description: String, owner: String, watchers: Int){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _image = State(wrappedValue: image)
        _title = State(wrappedValue: title)
        _description = State(wrappedValue: description)
        _owner = State(wrappedValue: owner)
        _watchers = State(wrappedValue: watchers)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 4){
                
                HStack(spacing: 20){
                    RepositoryTitleView(searchResultVm: repositoryResultsVm, title: title)
                    
                    Spacer()
                    
                    ViewRepositoryButtonView()
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
