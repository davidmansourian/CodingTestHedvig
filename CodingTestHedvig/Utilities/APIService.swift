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
    
    // https://api.github.com/search/users?q=davidmansourian

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
        //print(searchResults)
        return searchResults
    }
    
    
    func loadContributors(url: String) async throws -> RepositoryReturnTypeState<[ContributorElement], APIMaxedOutModel>{
        guard let urlString = URL(string: url) else { throw URLError(.badURL) }
        var contributors: [ContributorElement] = []
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            guard let JSONResponse = try? JSONDecoder().decode([ContributorElement].self, from: data) else {
                guard let nextJSONResponse = try? JSONDecoder().decode(APIMaxedOutModel.self, from: data) else {
                    throw DecodingError(
                        message: "Failed to decode JSON-data. Unknown error"
                    )
                }
                return .error(nextJSONResponse)
            }
            contributors = JSONResponse
        } catch {
            throw error
        }
        //print(searchResults)
        return .success(contributors)
    }
    
    func loadRepositoryData(url: String) async throws -> RepositoryReturnTypeState<[Welcome3Element], APIMaxedOutModel>{
        guard let urlString = URL(string: url) else { throw URLError(.badURL) }
        var searchResults: [Welcome3Element] = []
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            guard let JSONResponse = try? JSONDecoder().decode([Welcome3Element].self, from: data) else {
                guard let nextJSONResponse = try? JSONDecoder().decode(APIMaxedOutModel.self, from: data) else {
                    throw DecodingError(
                        message: "Failed to decode JSON-data. Unknown error"
                    )
                }
                return .error(nextJSONResponse)
            }
            searchResults = JSONResponse
        } catch {
            throw error
        }
        //print(searchResults)
        return .success(searchResults)
    }
    
    func loadRepoLanguages(url: String) async throws -> RepoLanguages{
        guard let urlString = URL(string: url) else { throw URLError(.badURL) }
        var languageDict: RepoLanguages?
        
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
            languageDict = try JSONDecoder().decode(RepoLanguages.self, from: data)
            
        } catch {
            throw error
        }
        //print(searchResults)
        return languageDict ?? RepoLanguages()
    }
    
    func getReadmeURL(url: String) async throws -> String{
        guard let urlString = URL(string: url) else { throw URLError(.badURL)}
        var readmeURL: String?
        do{
            let (data, _) = try await URLSession.shared.data(from: urlString)
           // print("this is reponse: \(response)")
            let readmeData = try JSONDecoder().decode(ReadmeDataModel.self, from: data)
            if readmeData.message == nil{
                readmeURL = readmeData.htmlURL
            } else {
                readmeURL = readmeData.message!
            }
        } catch {
            throw error
        }
        //print(searchResults)
        return readmeURL ?? ""
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
