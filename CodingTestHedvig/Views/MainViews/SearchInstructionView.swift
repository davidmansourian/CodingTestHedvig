//
//  SearchInstructionView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct SearchInstructionView: View {
    var body: some View {
        HStack{
            Text("Search profiles and view related repos")
                .font(.title)
                .fontWeight(.ultraLight)
                .padding()
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .opacity(0.2)
        }
        .padding()
    }
}

struct SearchInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        SearchInstructionView()
    }
}
