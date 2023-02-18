//
//  ProfileDetailModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import SwiftUI


struct ProfileDetailModel: Identifiable{
    let id = UUID()
    let profileUsername: String
    let profileAccountType: String
    let profileReposUrl: String
    let profileImage: UIImage
    let profileImageURL: String
}
