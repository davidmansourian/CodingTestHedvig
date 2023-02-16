//
//  LoadingIndicatorView.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct LoadingIndicatorView: View {
    var body: some View {
        ZStack{
            ProgressView()
        }
    }
}

struct LoadingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicatorView()
    }
}
