//
//  NetworkManager.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import Foundation


class NetworkManager {
    
    enum RequestType: String {
        case get = "GET"
        case post = "POST"
    }
    
    func fetchData(url: String, with requestType: RequestType) async throws(AppError) -> Data? {
        
        guard let url = URL(string: url) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        var (data, response): (Data?, URLResponse?) = (nil, nil)
        
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw AppError.apiError
        }
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            return data
        }
           
        return nil
        
    }
}
