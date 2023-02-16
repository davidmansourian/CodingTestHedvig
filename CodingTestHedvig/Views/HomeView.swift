//
//  HomeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct HomeView: View {
    @StateObject var apiLoader = APILoader()
    var body: some View {
        List(apiLoader.userResultModel ?? []){ results in
            Text(results.name ?? "Empty")
        }
        .task{
           await apiLoader.loadData(url: "https://api.github.com/users/davidmansourian/repos")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
