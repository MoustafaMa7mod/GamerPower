//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Moya
import Foundation

/// A concrete implementation of `Networkable` that handles API requests using Moya.
public class NetworkService: Networkable {
    
    // MARK: - Properties
    private var baseURL: String
    public var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Methods
    public init (baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func fetchData<T: Decodable>(requestParameters: [String : Any]) async throws -> T {
        let urlRequest = API.urlRequest(baseURL: baseURL, requestParameters: requestParameters)
        return try await request(request: urlRequest)
    }
}

// MARK: - Private Methods
extension NetworkService {
    
    /// Sends an API request using Moya and decodes the response into a specified `Decodable` type.
    ///
    /// - Parameter request: The API request to be executed.
    /// - Returns: A decoded object of type `T`.
    /// - Throws: An error if the request fails or decoding is unsuccessful.
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
