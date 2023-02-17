//
//  SingleRepositoryLanguagesView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryLanguagesView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var languagesUrl: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, languagesUrl: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _languagesUrl = State(wrappedValue: languagesUrl)
    }
    var body: some View {
        HStack{
            Text("Languages")
                .font(.subheadline)
                .fontWeight(.light)
                .padding(.top)
        }
        .onAppear{
            repositoryResultsVm.loadRepoLanguages(URLString: languagesUrl)
           // repositoryResultsVm.calculateLanguagePercentages()
        }
        HStack{
            ForEach(repositoryResultsVm.repoLanguages){ language in
                Color(UIColor(language.color))
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 15)
                    .clipShape(Circle())
            }
        }
    }
}
