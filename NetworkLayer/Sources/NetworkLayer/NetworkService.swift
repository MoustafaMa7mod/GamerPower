//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Moya
import Foundation

protocol Networkable {
    var provider: MoyaProvider<API> { get }
}

public class NetworkService: Networkable {
    
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])

    public init () {}
    
    public func fetchData<T: Decodable>(
        baseURL: String,
        path: String = ""
    ) async throws -> T {
        
        let urlRequest = API.urlRequest(baseURL: baseURL, path: path)
        return try await request(request: urlRequest)
    }
}

// MARK: - Private Methods
extension NetworkService {
    
    private func request<T: Decodable>(request: API) async throws -> T {
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(request) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                        continuation.resume(returning: decodedData)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
