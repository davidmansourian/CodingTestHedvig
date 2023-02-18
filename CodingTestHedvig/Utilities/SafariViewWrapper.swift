//
//  SafariViewWrapper.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import SwiftUI
import SafariServices
import Foundation

// source: https://designcode.io/swiftui-handbook-safari-inside-app

struct SFSafariViewWrapper: UIViewControllerRepresentable{
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController{
        return SFSafariViewController(url: url)
    }
    
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}
