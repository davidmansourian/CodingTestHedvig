//
//  SingleRepositoryContributorsView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryContributorsView: View {
    @State private var showContributors: Bool = false
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    @State var image: UIImage
    @State var contributorsURL: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String, image: UIImage, contributorsURL: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
        _image = State(wrappedValue: image)
        _contributorsURL = State(wrappedValue: contributorsURL)
    }
    var body: some View {
        Button {
                showContributors.toggle()
        } label: {
            VStack{
                HStack{
                    Text("Contributors")
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.top)
                }
                
                HStack{
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .clipShape(Circle())
                    
                }
            }
            .sheet(isPresented: $showContributors, content: {
                ContributorsView(repositoryResultsVm: repositoryResultsVm)
            })
            .foregroundColor(.blue)

        }
        .padding()
        .buttonStyle(.plain)
    }
}
