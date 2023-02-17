//
//  SingleRepositoryTitleView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryTitleView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _title = State(wrappedValue: title)
    }
    
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.light)
            .padding(.leading)
            .padding(.top)
    }
}
