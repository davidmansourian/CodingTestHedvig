//
//  RepositoryProfileAvatarView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct RepositoryProfileAvatarView: View {
    @StateObject var repositoryResultsVm: RepositoryResultsViewModel
    @State var image: UIImage
    
    init(searchResultVm: RepositoryResultsViewModel, image: UIImage){
        _repositoryResultsVm = StateObject(wrappedValue: searchResultVm)
        _image = State(wrappedValue: image)
    }
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 20)
            .clipShape(Circle())
            .padding(.bottom, 3)
    }
}
