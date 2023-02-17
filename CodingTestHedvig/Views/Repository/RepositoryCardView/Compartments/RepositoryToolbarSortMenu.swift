//
//  RepositoryToolbarSortMenu.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct RepositoryToolbarSortMenu: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    
    init(repositoryResultsVm: RepositoryResultsViewModel){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
    }
    
    var body: some View {
        Menu {
            Menu("By watchers"){
                Button(action: {
                    repositoryResultsVm.sortRepositories(action: SortRepository.watchersDescending)
                }) {
                    Label("Descending", systemImage: "arrow.down")
                }

                Button(action: {
                    repositoryResultsVm.sortRepositories(action: SortRepository.watchersAscending)
                }) {
                    Label("Ascending", systemImage: "arrow.up")
                }
            }
            Menu("By date"){
                Button(action: {
                    repositoryResultsVm.sortRepositories(action: SortRepository.createdNewest)
                }) {
                    Label("Last created", systemImage: "calendar.day.timeline.right")
                }

                Button(action: {
                    repositoryResultsVm.sortRepositories(action: SortRepository.createdOldest)
                }) {
                    Label("First created", systemImage: "calendar.day.timeline.left")
                        .rotationEffect(Angle(degrees: 180))
                        
                }
                Button(action: {
                    repositoryResultsVm.sortRepositories(action: SortRepository.lastUpdated)
                }) {
                    Label("Last updated", systemImage: "calendar.badge.clock")
                }
            }
        }
        label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}
