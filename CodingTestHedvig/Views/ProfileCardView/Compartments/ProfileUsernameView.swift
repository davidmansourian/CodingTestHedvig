//
//  ProfileUsernameView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct ProfileUsernameView: View {
    @StateObject var profileResultsVm: ProfileResultsViewModel
    @State var username: String
    
    init(profileResultsVm: ProfileResultsViewModel, username: String){
        _profileResultsVm = StateObject(wrappedValue: profileResultsVm)
        _username = State(wrappedValue: username)
    }
    var body: some View {
        Text(username)
            .font(.subheadline)
            .fontWeight(.semibold)
            //.padding(.bottom, 3)
    }
}
