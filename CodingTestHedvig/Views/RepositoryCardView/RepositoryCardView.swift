//
//  SearchResultCardView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryCardView: View {
    @StateObject var searchResultVm: RepositoryResultsViewModel
    @State var image = UIImage()
    @State var title: String
    @State var description: String
    @State var owner: String
    
    init(searchResultVm: RepositoryResultsViewModel, image: UIImage, title: String, description: String, owner: String){
        _searchResultVm = StateObject(wrappedValue: searchResultVm)
        _image = State(wrappedValue: image)
        _title = State(wrappedValue: title)
        _description = State(wrappedValue: description)
        _owner = State(wrappedValue: owner)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 4){
                
                HStack(spacing: 20){
                    RepositoryTitleView(searchResultVm: searchResultVm, title: title)
                    
                    Spacer()
                    
                    ViewRepositoryButtonView()
                }
               // .padding(.top, 3)
                
                RepositoryDescriptionView(searchResultVm: searchResultVm, description: description)
            }
            .padding(.horizontal)
            
            HStack{
                RepositoryProfileAvatarView(searchResultVm: searchResultVm, image: image)
                
                RepositoryOwnerView(searchResultVm: searchResultVm, owner: owner)
            }
            .padding(.horizontal)
        }
        
    }
}
