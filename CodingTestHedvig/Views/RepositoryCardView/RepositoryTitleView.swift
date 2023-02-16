//
//  RepositoryTitleView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryTitleView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var title: String
    
    init(searchResultVm: RepositoryResultsViewModel, title: String){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _title = State(wrappedValue: title)
    }
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
    }
}
