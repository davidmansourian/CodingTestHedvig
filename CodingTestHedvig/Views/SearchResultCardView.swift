//
//  SearchResultCardView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct SearchResultCardView: View {
    @StateObject var searchResultVm: SearchResultViewModel
    @State var image = UIImage()
    @State var title: String
    @State var description: String
    @State var owner: String
    
    init(searchResultVm: SearchResultViewModel, image: UIImage, title: String, description: String, owner: String){
        _searchResultVm = StateObject(wrappedValue: searchResultVm)
        _image = State(wrappedValue: image)
        _title = State(wrappedValue: title)
        _description = State(wrappedValue: description)
        _owner = State(wrappedValue: owner)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading, spacing: 4){
                HStack(spacing: 20){
                    Text(title)
                        .font(.title3)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("View Repo")
                    }



                }
                .padding(.top, 3)
                
                Text(description)
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            .padding(.horizontal)
            
            HStack{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .clipShape(Circle())
                    .padding(.bottom, 3)
                
                Text(" by \(owner)")
                    .font(.callout)
                    .fontWeight(.thin)
                    .padding(.bottom, 3)
            }
            .padding(.horizontal)
        }
        /*.background(
            Rectangle()
                .fill(Color.white.opacity(0.2))
        )
        .cornerRadius(15)
        .shadow(radius: 2)*/
        
    }
}

/*struct SearchResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultCardView(searchResultVm: SearchResultViewModel())
    }
}*/
