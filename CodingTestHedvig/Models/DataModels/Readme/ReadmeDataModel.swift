//
//  ReadmeDataModel.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-18.
//

import Foundation


struct ReadmeDataModel: Decodable{
    let htmlURL: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case message
    }
}
