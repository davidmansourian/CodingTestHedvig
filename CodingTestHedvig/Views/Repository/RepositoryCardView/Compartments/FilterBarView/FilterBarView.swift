//
//  FilterBarView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct FilterBarView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State private var selection: RepositoryFilterBarState = .all
    @Namespace var animation
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    var body: some View {
        HStack{
            ForEach(RepositoryFilterBarState.allCases, id: \.rawValue){ tab in
                VStack{
                    Text(tab.title)
                        .font(.subheadline)
                        .fontWeight(repositoryResultsVm.filterBarState == tab ? .semibold : .regular)
                        .foregroundColor(
                            repositoryResultsVm.filterBarState == tab ? .primary : .gray
                        )
                    
                    if repositoryResultsVm.filterBarState == tab{
                        Capsule()
                            .foregroundColor(Color.blue)
                            .opacity(0.5)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.repositoryResultsVm.filterBarState = tab
                    }
                }
            }
        }
    }
}

