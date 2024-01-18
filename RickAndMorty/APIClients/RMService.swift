//
//  RMService.swift
//  RickAndMorty
//
//  Created by Тасік on 16.01.2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService{
    
    /// Shared singleton instance
    static let shared = RMService()
    
    
    /// Privitized constructor
    private init() {}
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute<T : Codable>(
                        _ request : RMRequest,
                         expecting type : T.Type,
                        completion: @escaping (Result<T, Error>) -> Void)
                        {
                            
                        }
}
