//
//  SingleRepositoryLanguagesView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryLanguagesView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
    }
    var body: some View {
        HStack{
            Text("Languages")
                .font(.subheadline)
                .fontWeight(.light)
                .padding(.top)
        }
        
        HStack{
            Color(.systemPurple)
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
                .clipShape(Circle())
        }
    }
}
