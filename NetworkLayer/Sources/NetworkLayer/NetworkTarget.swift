//
//  NetworkTarget.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Moya
import Foundation

/// A protocol that defines a network request target using Moya.
protocol NetworkTarget: TargetType {
    
    /// The base URL of the API as a string.
    var baseURLString: String { get }
    
    /// The query parameters to be included in the request.
    var requestParameters: [String: Any] { get }
}

extension NetworkTarget {
    
    /// Converts the `baseURLString` into a `URL` object.
    ///
    /// - Returns: A valid `URL` object.
    /// - Throws: A fatal error if the URL is invalid.
    public var baseURL: URL {
        guard let url = URL(string: baseURLString) else { fatalError("Invalid Base URL") }
        return url
    }
    
    /// Defines the request task, including parameters and encoding type.
    public var task: Task {
        return .requestParameters(parameters: requestParameters, encoding: URLEncoding.queryString)
    }
    
    /// Specifies the default headers for the request.
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    /// Provides sample data for testing purposes.
    public var sampleData: Data {
        return Data()
    }
}
