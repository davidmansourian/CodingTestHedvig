//
//  NoRepositoriesView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct NoRepositoriesView: View {
    var body: some View {
        HStack{
            Image(systemName: "eyes")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .opacity(0.2)
            
            Text("No repositories to show")
                .font(.title2)
                .fontWeight(.ultraLight)
                .padding()
        }
        .padding()
    }
}

struct NoRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NoRepositoriesView()
    }
}
