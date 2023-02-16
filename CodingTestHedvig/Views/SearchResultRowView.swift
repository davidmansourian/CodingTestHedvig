//
//  SearchResultRowView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct SearchResultRowView: View {
    @StateObject var searchResultVm: SearchResultViewModel
    
    init(searchResultVm: SearchResultViewModel){
        _searchResultVm = StateObject(wrappedValue: searchResultVm)
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRowView(searchResultVm: SearchResultViewModel())
    }
}
