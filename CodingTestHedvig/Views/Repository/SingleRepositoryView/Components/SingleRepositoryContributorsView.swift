//
//  SingleRepositoryContributorsView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryContributorsView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
    }
    var body: some View {
        Button {
            //
        } label: {
            VStack{
                HStack{
                    Text("Contributors")
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.top)
                }
                
                HStack{
                    Image("avatarTest")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .clipShape(Circle())
                    
                }
            }
            .foregroundColor(.blue)

        }
        .padding()
        .buttonStyle(.plain)
    }
}
