//
//  ProfileAvatarView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct ProfileAvatarView: View {
    @StateObject var profileResultsVm: ProfileResultsViewModel
    @State var image = UIImage()
    
    init(profileResultsVm: ProfileResultsViewModel, image: UIImage){
        _profileResultsVm = StateObject(wrappedValue: profileResultsVm)
        _image = State(wrappedValue: image)
    }
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .clipShape(Circle())
            .padding(.bottom, 3)
    }
}
