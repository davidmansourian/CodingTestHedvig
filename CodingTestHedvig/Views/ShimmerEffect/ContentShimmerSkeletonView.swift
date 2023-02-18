//
//  ContentShimmerSkeletonView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct ContentShimmerSkeletonView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    ShimmerEffectView()
                        .frame(width: 150, height: 20)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                HStack {
                    ShimmerEffectView()
                        .frame(width: 120, height: 15)
                        .padding(.leading)
                    
                    ShimmerEffectView()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 15)
                        .clipShape(Circle())
                    
                    Spacer()
                }
                .padding(.top, 5)
                
                HStack{
                    ShimmerEffectView()
                        .frame(width: 250, height: 10)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Group{
                        ShimmerEffectView()
                            .frame(height: 10)
                            .clipShape(Circle())
                        
                        ShimmerEffectView()
                            .frame(height: 10)
                            .clipShape(Circle())
                        
                        ShimmerEffectView()
                            .frame(height: 10)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                    
                }
                .padding(.top, 5)
                
                VStack(spacing: 50){
                    HStack{
                        ShimmerEffectView()
                            .frame(width: 210, height: 20)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack{
                        ShimmerEffectView()
                            .frame(width: 170, height: 20)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack{
                        ShimmerEffectView()
                            .frame(width: 80, height: 20)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack{
                        ShimmerEffectView()
                            .frame(width: 150, height: 20)
                            .padding(.leading)
                        
                        Spacer()
                    }
                }
                .padding(.top, 50)
                
                HStack(spacing: 30){
                    VStack{
                        ShimmerEffectView()
                            .frame(width: 80, height: 20)
                        
                        ShimmerEffectView()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .clipShape(Circle())
                    }
                    
                    VStack{
                        ShimmerEffectView()
                            .frame(width: 80, height: 20)
                        
                        ShimmerEffectView()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 40)
                
                Spacer()
                
            }
            .padding(.top)
        }
    }
}

struct ContentShimmerSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentShimmerSkeletonView()
    }
}
