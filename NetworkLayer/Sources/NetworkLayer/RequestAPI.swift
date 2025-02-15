// The Swift Programming Language
// https://docs.swift.org/swift-book

import Moya

/// An enumeration representing different API request types.
public enum API {
    /// A generic API request with a base URL and query parameters.
    case urlRequest(baseURL: String, requestParameters: [String : Any])
}

extension API: NetworkTarget {
    
    /// The base URL string for the API request.
    public var baseURLString: String {
        switch self {
        case .urlRequest(let baseURL, _):
            return baseURL
        }
    }
    
    /// The endpoint path for the API request.
    public var path: String {
        return ""
    }
    
    /// The query parameters included in the request.
    public var requestParameters: [String : Any] {
        switch self {
        case .urlRequest(_, let parameters):
            return parameters
        }
    }
    
    /// The HTTP method used for the request.
    public var method: Moya.Method {
        return .get
    }
}
