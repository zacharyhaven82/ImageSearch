//
//  NetworkManager.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

let imgurAuthHeaders = ["Authorization": "Client-ID b067d5cb828ec5a"]

enum NetworkError: Error {
    case invalidUrl, decodingError, httpError
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct NetworkRequest {
    
    let httpMethod: HTTPMethod = .get
    let url: String
    var headers: [String: String]?
    
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidUrl
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}

struct NetworkManager {
    
    private let session = URLSession.shared
    private let cache = URLCache.shared
    private let usingCache = true
    
    func makeRequest<Response: Codable>(for request: NetworkRequest) async throws -> Response {
        let urlRequest = try request.urlRequest()
        
        var data: Data
        
        if let cachedData = getCachedData(for: urlRequest), usingCache {
            data = cachedData
        } else {
            let (networkData, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError
            }
            saveToCache(request: urlRequest, response: response, data: networkData)
            data = networkData
        }
            
        do {
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func makeImageRequest(for request: NetworkRequest) async throws -> Data {
        let urlRequest = try request.urlRequest()
        
        if let data = getCachedData(for: urlRequest) {
            return data
        } else {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError
            }
            
            saveToCache(request: urlRequest, response: response, data: data)
            
            return data
        }
    }
    
    private func saveToCache(request: URLRequest, response: URLResponse, data: Data) {
        cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
    }
    
    private func getCachedData(for request: URLRequest) -> Data? {
        return cache.cachedResponse(for: request)?.data
    }
}
