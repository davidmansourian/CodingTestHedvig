//
//  ProfileCardView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct ProfileCardView: View {
    @StateObject var profileResultsVm: ProfileResultsViewModel
    @State var image = UIImage()
    @State var username: String
    @State var type: String
    @State var isActive = false
    
    init(profileResultsVm: ProfileResultsViewModel, image: UIImage, username: String, type: String){
        _profileResultsVm = StateObject(wrappedValue: profileResultsVm)
        _image = State(wrappedValue: image)
        _username = State(wrappedValue: username)
        _type = State(wrappedValue: type)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 4){
                
                HStack(spacing: 20){
                    
                    ProfileAvatarView(profileResultsVm: profileResultsVm, image: image)
                    
                    ProfileUsernameView(profileResultsVm: profileResultsVm, username: username)
                    
                    Spacer()
                    
                    ProfileTypeView(profileResultsVm: profileResultsVm, type: type)
                    
                  ChevronRightView()
                }
                //.padding(.top, 3)
            }
            .padding(.horizontal)
        }
    }
}
