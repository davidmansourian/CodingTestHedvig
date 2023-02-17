//
//  SingleRepositoryDescriptionView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryDescriptionView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var description: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, description: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _description = State(wrappedValue: description)
    }
    var body: some View {
        Text(description)
            .font(.caption)
            .fontWeight(.light)
            .padding(.horizontal)
            .padding(.top, 1)
    }
}
