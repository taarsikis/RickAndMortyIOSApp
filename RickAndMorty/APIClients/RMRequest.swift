//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Тасік on 16.01.2024.
//

import Foundation


/// Object that represents single API call
final class RMRequest{
    
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint : RMEndpoint
    
    private let pathComponents : Set<String>
    
    private let queryParameters : [URLQueryItem]
    
    
    /// Constructed url for the API request in the string format
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url : URL?{
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
