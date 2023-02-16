//
//  ButtonViews.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import SwiftUI

struct BlueButtonSmaller: ButtonStyle {
    let blueButtonColor: Color = Color(red: 13/255, green: 110/255, blue: 253/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(height: 10)
            .frame(maxWidth: 50)
            .padding()
            .background(blueButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
