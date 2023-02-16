//
//  APIService.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import Combine
import SwiftUI

class APILoader{
    static let shared = APILoader()
    
    @Published var userResultModel: [Welcome3Element]?
    @Published var fetchType: String = ""
    
    private var jsonDecoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()
    private var searchType = SearchType.userRepository
    
    // https://api.github.com/search/users?q=davidmansourian
    

    
   private init(){}
    
    func loadData(url: String) async -> [Welcome3Element]{
        guard let urlString = URL(string: url) else { return [] }
        var searchResult: [Welcome3Element] = []
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            searchResult = try JSONDecoder().decode([Welcome3Element].self, from: data)
        } catch {
            print(error)
        }
        print(searchResult)
        return searchResult
    }
    
    
    func handleImageResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                return nil
        }
        
        return image
    }
    
    
    func downloadImage(urlString: String) async throws -> UIImage? {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            let image = handleImageResponse(data: data, response: response)
            return image
        } catch {
            throw error
        }
    }
    
    
    
    
    
    
}
