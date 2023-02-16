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
    @Published var username: String = ""
    
    private var jsonDecoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()
    private var searchType = SearchType.user
    
    // https://api.github.com/search/users?q=davidmansourian
    
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
    
    func urlBuilder(searchString: String){
        var components = URLComponents(string: fetchUrl)
        
        components?.queryItems = [URLQueryItem(name: "searchType", value: searchType.rawValue),
                                  URLQueryItem(name: "username", value: self.username)
                                  
            
        ]
    }
    
    
    
    
    
    
}
