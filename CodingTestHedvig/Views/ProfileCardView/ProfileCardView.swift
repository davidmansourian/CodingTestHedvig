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
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .clipShape(Circle())
                        .padding(.bottom, 3)
                    
                    Text(username)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                            .padding(.bottom, 3)


  
                }
                .padding(.top, 3)
            }
            .padding(.horizontal)
            
            HStack{
                Text(type)
                    .font(.body)
                    .fontWeight(.ultraLight)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        
    }
}
