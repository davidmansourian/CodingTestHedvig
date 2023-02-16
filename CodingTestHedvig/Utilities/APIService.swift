//
//  APIService.swift
//  CodingTestHedvig
//
//  Created by David on 2023-02-16.
//

import Foundation
import SwiftUI

class APIService{
    static let shared = APIService()
    
    @Published var fetchedRepositories: [Welcome3Element]?
    @Published var fetchedProfiles: [ProfileDataModel]?
    private var jsonDecoder = JSONDecoder()
    private var searchType = SearchType.userSearch
    
    // https://api.github.com/search/users?q=davidmansourian
    
    // Rules: Admit a maximum of three users from user results.
    // Grab only repo url
    // Show repos for admitted users
    //
    // Another idea is to list the top three or five git profiles and
    // let the user pick the profile from that list
    // Perhaps this is more efficient in selecting the desired profile
    // When searching for "david", there are several profiles that pops up.
    

    
   private init(){}
    
    
    func loadProfiles(url: String) async throws -> ProfileDataModel{
        guard let urlString = URL(string: url) else { throw URLError(.badURL) }
        var searchResults: ProfileDataModel
        
        do {
            let (data, _) = try await URLSession.shared.data(from: urlString)
            searchResults = try JSONDecoder().decode(ProfileDataModel.self, from: data)
        } catch{
            throw error
        }
        print(searchResults)
        return searchResults
    }
    
    func loadRepositoryData(url: String) async throws -> [Welcome3Element]{
        guard let urlString = URL(string: url) else { throw URLError(.badURL) }
        var searchResults: [Welcome3Element] = []
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            searchResults = try JSONDecoder().decode([Welcome3Element].self, from: data)
        } catch {
            throw error
        }
        print(searchResults)
        return searchResults
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
