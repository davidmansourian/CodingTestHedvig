//
//  APIService.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import Combine

class APILoader: ObservableObject{
   // static let shared = APILoader()
    
    @Published var userResultModel: [Welcome3Element]?
    @Published var searchString: String = ""
    @Published var fetchType: String = ""
    
    private var jsonDecoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()
    private var searchType = SearchType.userRepository
    
    // https://api.github.com/search/users?q=davidmansourian
    
    var fetchUrl = ""

    
    init(){
        $searchString
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global(qos: .default))
            .sink{ [weak self] searchTerm in
                if searchTerm == ""{
                    //
                } else {
                    self?.fetchUrl = "https://api.github.com/users/\(searchTerm)/repos"
                }
                
            }
            .store(in: &cancellables)
    }
    
    func loadData(url: String) async{
        guard let urlString = URL(string: url) else { return }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            self.userResultModel = try JSONDecoder().decode([Welcome3Element].self, from: data)
            print(self.userResultModel)
        } catch {
            print(error)
        }
        
    }
    
    
    
    
    
    
}
