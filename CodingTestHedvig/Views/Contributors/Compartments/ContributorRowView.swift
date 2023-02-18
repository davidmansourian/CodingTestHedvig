//
//  ContributorRowView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct ContributorRowView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var username: String
    @State var image: UIImage
    @State var contributions: Int
    
    init(repositoryResultsVm: RepositoryResultsViewModel, username: String, image: UIImage, contributions: Int){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _username = State(wrappedValue: username)
        _image = State(wrappedValue: image)
        _contributions = State(wrappedValue: contributions)
    }
    var body: some View {
        HStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
                .clipShape(Circle())
                .padding(.leading)
            
            Text(username)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text("\(contributions) contributions")
                .font(.subheadline)
                .fontWeight(.thin)
                .padding(.trailing)
                .foregroundColor(.primary)
        }
    }
}
