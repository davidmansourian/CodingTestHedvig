//
//  ContributorsDataModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-17.
//

import Foundation
import SwiftUI

struct ContributorDataModel: Identifiable{
    let id = UUID()
    let username: String
    let image: UIImage
    let contributions: Int
}
