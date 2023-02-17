//
//  RepositoryDescriptionView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryDescriptionView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var description: String
    
    init(searchResultVm: RepositoryResultsViewModel, description: String){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _description = State(wrappedValue: description)
    }
    var body: some View {
        Text(description)
            .font(.subheadline)
            .fontWeight(.light)
    }
}
