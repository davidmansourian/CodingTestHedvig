//
//  ViewRepositoryButtonView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct ViewRepositoryButtonView: View {
    @StateObject var pickedRepositoryVm = PickedRepositoryViewModel()
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
        HStack{
            Button {
                pickedRepositoryVm.showingRepository.toggle()
            } label: {
                Text("View Repository")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .fullScreenCover(isPresented: $pickedRepositoryVm.showingRepository, onDismiss: pickedRepositoryVm.didDismiss) {
                    SingleRepositoryView(repositoryResultsVm: repositoryResultsVm, image: image, title: title, description: description, owner: owner, watchers: watchers, stars: stars, forks: forks, contributorsUrl: contributorsUrl, languagesUrl: languagesUrl, activeIssues: activeIssues)
            }
        }
    }
}
