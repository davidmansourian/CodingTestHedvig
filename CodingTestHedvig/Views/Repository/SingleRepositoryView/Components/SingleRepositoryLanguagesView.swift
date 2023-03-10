//
//  SingleRepositoryLanguagesView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI
import Charts

struct SingleRepositoryLanguagesView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var languagesUrl: String
    
    init(repositoryResultsVm: RepositoryResultsViewModel, languagesUrl: String){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _languagesUrl = State(wrappedValue: languagesUrl)
    }
    var body: some View {
        Chart(repositoryResultsVm.repoLanguages){ element in
            let barColor = Color(hex: element.color.description) ?? .primary
                BarMark(
                    x: .value("Percentage", Int(element.percentage ?? 0)),
                    y: .value("Language", element.language )
                )
                .foregroundStyle(barColor)
                //.foregroundStyle(by: .value("Languages", element.language))
                .annotation(position: .trailing, alignment: .center) {
                    Text("\(element.percentage ?? 0, format: .number.precision(.fractionLength(2)))%")
                        .foregroundColor(.primary)
                        .font(.caption2)
                }
        }
        .padding()
        .onAppear(){
            repositoryResultsVm.loadRepoLanguages(URLString: languagesUrl)
           // print("array is \(String(describing: repositoryResultsVm.repoLanguages))")
            // repositoryResultsVm.calculateLanguagePercentages()
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(colorScheme == .dark ? Color.black : Color.white)
                .shadow(radius: 2)
        )
        .padding(.horizontal, 10)
        .padding(.top, 5)
    }
}
