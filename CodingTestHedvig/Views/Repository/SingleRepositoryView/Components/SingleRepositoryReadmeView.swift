//
//  SingleRepositoryReadmeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryReadmeView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
    }
    
    var body: some View {
        HStack{
            Text("README")
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
}
