//
//  APIService.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import Combine

class APILoader: ObservableObject{
    static let shared = APILoader()
    
    @Published var userResultModel: UserResultModel?
    @Published var searchString: String = ""
    @Published var fetchType: String = ""
    
    private var jsonDecoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()
    private var searchType = SearchType.user
    
    let fetchUrl = "https://api.github.com/"
    
    private init(){
        $searchString
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global(qos: .default))
            .sink{ [weak self] searchTerm in
                if searchTerm == ""{
                    //
                } else {
                    //
                }
                
            }
            .store(in: &cancellables)
    }
    
    
    
    
    
    
}
