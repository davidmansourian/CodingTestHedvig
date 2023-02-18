//
//  OfflineView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI

struct OfflineView: View {
    var body: some View {
        Text("You are not connected to the internet :(")
            .font(.title3)
            .fontWeight(.thin)
        
        Text("This screen will refresh when internet is detected")
            .font(.subheadline)
            .fontWeight(.ultraLight)
            .padding()
        
    }
}

struct OfflineView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineView()
    }
}
