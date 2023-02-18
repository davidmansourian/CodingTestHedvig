//
//  ViewDelegator.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct ViewDelegator: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        Group{
            if networkManager.isConnected{
                ProfileSearchView()
            } else {
                OfflineView()
            }
        }
    }
}

struct ViewDelegator_Previews: PreviewProvider {
    static var previews: some View {
        ViewDelegator()
    }
}
