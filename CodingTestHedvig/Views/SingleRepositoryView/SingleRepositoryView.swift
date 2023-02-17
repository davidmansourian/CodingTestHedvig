//
//  SingleRepositoryView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import SwiftUI

struct SingleRepositoryView: View {
    @State var itemHovered: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            // add owner besie Best App Ever
            HStack{
                Text("Best App Ever")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.leading)
                    .padding(.top)
            }
            
            HStack{
                Text("by davidmansourian")
                    .fontWeight(.ultraLight)
                    .padding(.leading)
                
                Image("avatarTest")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 15)
                    .clipShape(Circle())
                
            }
            .offset(y: -5)
            
            HStack{
                Text("Best App Ever Description This app comes from apple tries to be the best ever")
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .padding(.top, 1)
                
                Image(systemName: "eye")
                    .font(.caption)
                    .fontWeight(.light)
                
                Text("73")
                    .font(.caption)
                    .fontWeight(.light)
                
                Image(systemName: "star")
                    .font(.caption)
                    .fontWeight(.light)
                
                Text("33")
                    .font(.caption)
                    .fontWeight(.light)
                
                Image(systemName: "tuningfork")
                    .font(.caption)
                    .fontWeight(.light)
                
                Text("45")
                    .font(.caption)
                    .fontWeight(.light)
                
              //  Spacer ()
                
            }
            
            .padding(.trailing)
            
            HStack(alignment: .top){
                
                VStack{
                    
                    HStack{
                        Text("Collaborators")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.top)
                        
                        Text("View")
                            .font(.caption)
                            .padding(.top)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    
                    HStack{
                        Image("avatarTest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Image("avatarTest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Image("avatarTest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Image("avatarTest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Image("avatarTest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                    }
                }
                
                VStack{
                    
                    HStack{
                        Text("Languages")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.top)
                    }
                    
                    HStack{
                        Color(.systemPurple)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())

                        
                        Color(.systemBlue)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Color(.systemYellow)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                        
                        Color(.systemGreen)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .clipShape(Circle())
                    }
                }
                
                VStack{
                    
                    HStack{
                        Text("README")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.top)
                    }
                    
                    HStack{
                        Image(systemName: "doc")
                            .frame(height: 15)
                    }
                }


            }
            .frame(maxWidth: .infinity)
           // .border(.red)
            
            
            VStack(spacing: 20){
                HStack {
                    Spacer()
                    Text("Created: 390 days ago")
                        .font(.title2)
                    .fontWeight(.light)
                    Spacer()
                }
                HStack {
                    Text("Updated: 33 days ago")
                        .font(.title2)
                    .fontWeight(.light)
                    
                    
                }
                HStack {
                    Text("Commits: 128")
                        .font(.title2)
                    .fontWeight(.light)
                }
                HStack {
                    Text("Active Issues: 4")
                        .font(.title2)
                    .fontWeight(.light)
                }
            }
            .padding()
            //.border(.red)
            
            Spacer()
            
        }
    }
}

struct SingleRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRepositoryView()
    }
}
