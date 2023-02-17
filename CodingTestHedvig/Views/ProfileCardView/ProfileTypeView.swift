//
//  ProfileTypeView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct ProfileTypeView: View {
    @StateObject var profileResultsVm: ProfileResultsViewModel
    @State var type: String
    
    init(profileResultsVm: ProfileResultsViewModel, type: String){
        _profileResultsVm = StateObject(wrappedValue: profileResultsVm)
        _type = State(wrappedValue: type)
    }
    var body: some View {
        Text(type)
            .font(.body)
            .fontWeight(.ultraLight)
    }
}
