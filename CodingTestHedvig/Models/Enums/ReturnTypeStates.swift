//
//  ReturnType.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-19.
//

import Foundation

enum RepositoryReturnTypeState<Success, Fail>{
    case success(Success)
    case error(Fail)
}
