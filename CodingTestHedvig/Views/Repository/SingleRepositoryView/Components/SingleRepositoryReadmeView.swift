//
//  SingleRepositoryReadmeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryReadmeView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var owner: String
    @State var title: String
    @State private var showSafari: Bool = false
    
    init(repositoryResultsVm: RepositoryResultsViewModel, owner: String, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _owner = State(wrappedValue: owner)
        _title = State(wrappedValue: title)
    }
    
    var body: some View {
        Button {
                showSafari.toggle()
        } label: {
            VStack{
                HStack{
                    Text("View README")
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.top)
                }
                
                HStack{
                    Image(systemName: "doc")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                }
            }
            .foregroundColor(.blue)
        }
        .padding()
        .buttonStyle(.plain)
        .fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper(url: (URL(string: repositoryResultsVm.readmeURL ?? "") ?? URL(string: ""))!)
        })
    }
}
