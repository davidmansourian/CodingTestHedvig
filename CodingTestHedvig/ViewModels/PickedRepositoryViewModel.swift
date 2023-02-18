//
//  PickedRepositoryViewModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation


class PickedRepositoryViewModel: ObservableObject{
    @Published var showingRepository: Bool = false
    
    
    func didDismiss(){
        self.showingRepository = false
    }
}
