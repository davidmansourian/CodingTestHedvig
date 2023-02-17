//
//  RepositoryOwnerView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryOwnerView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var owner: String
    
    init(searchResultVm: RepositoryResultsViewModel, owner: String){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _owner = State(wrappedValue: owner)
    }
    var body: some View {
        Text("owned by \(owner)")
            .font(.footnote)
            .fontWeight(.thin)
            .padding(.bottom, 3)
    }
}
