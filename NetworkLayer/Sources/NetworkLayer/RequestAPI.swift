// The Swift Programming Language
// https://docs.swift.org/swift-book

import Moya

enum API {
    case urlRequest(baseURL: String, path: String)
}

extension API: NetworkTarget {
    
    var baseURLString: String {
        switch self {
        case .urlRequest(let baseURL, _):
            return baseURL
        }
    }
    
    var endpointPath: String {
        switch self {
        case .urlRequest(_, let path):
            return path
        }
    }
    
    var method: Moya.Method {
        return .get
    }
}
