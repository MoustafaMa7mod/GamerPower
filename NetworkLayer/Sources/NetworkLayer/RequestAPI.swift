// The Swift Programming Language
// https://docs.swift.org/swift-book

import Moya

enum API {
    case urlRequest(baseURL: String, requestParameters: [String : Any])
}

extension API: NetworkTarget {
    
    var baseURLString: String {
        switch self {
        case .urlRequest(let baseURL, _):
            return baseURL
        }
    }
    
    var path: String {
        return ""
    }
    
    var requestParameters: [String : Any] {
        switch self {
        case .urlRequest(_, let parameters):
            return parameters
        }
    }
    
    var method: Moya.Method {
        return .get
    }
}
