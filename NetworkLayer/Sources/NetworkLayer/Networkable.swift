//
//  Networkable.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import Moya
import Foundation

/// A protocol defining a network service capable of making API requests using Moya.
public protocol Networkable {
    
    /// The Moya provider responsible for handling API requests.
    var provider: MoyaProvider<API> { get }
    
    /// Fetches data from an API endpoint and decodes it into a specified `Decodable` type.
    ///
    /// - Parameters:
    ///   - requestParameters: A dictionary containing query parameters for the request.
    /// - Returns: A decoded object of type `T`.
    /// - Throws: An error if the request fails or decoding is unsuccessful.
    func fetchData<T: Decodable>(requestParameters: [String: Any]) async throws -> T
}
