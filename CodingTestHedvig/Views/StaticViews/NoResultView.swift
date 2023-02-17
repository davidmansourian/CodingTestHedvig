//
//  NoResultView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct NoResultView: View {
    var body: some View {
        HStack{
            Image(systemName: "face.smiling")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .opacity(0.2)
                .rotationEffect(Angle(degrees: 180))
            
            Text("No results")
                .font(.title2)
                .fontWeight(.ultraLight)
                .padding()
        }
        .padding()
    }
}
