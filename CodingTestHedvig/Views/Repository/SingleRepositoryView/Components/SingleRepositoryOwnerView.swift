//
//  SingleRepositoryOwnerView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryOwnerView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var owner: String
    @State var image: UIImage
    
    init(repositoryResultsVm: RepositoryResultsViewModel, owner: String, image: UIImage){
        _repositoryResultsVm = StateObject(wrappedValue: repositoryResultsVm)
        _owner = State(wrappedValue: owner)
        _image = State(wrappedValue: image)
    }
    var body: some View {
        Text("by \(owner)")
            .fontWeight(.ultraLight)
            .padding(.leading)
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 15)
            .clipShape(Circle())
    }
}
