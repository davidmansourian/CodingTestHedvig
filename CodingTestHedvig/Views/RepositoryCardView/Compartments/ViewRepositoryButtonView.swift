//
//  ViewRepositoryButtonView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct ViewRepositoryButtonView: View {
    @StateObject var pickedRepositoryVm = PickedRepositoryViewModel()
    
    
    var body: some View {
        HStack{
            Button {
                pickedRepositoryVm.showingRepository.toggle()
            } label: {
                Text("View Repository")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $pickedRepositoryVm.showingRepository, onDismiss: pickedRepositoryVm.didDismiss) {
                SingleRepositoryView()
            }
        }
    }
}
