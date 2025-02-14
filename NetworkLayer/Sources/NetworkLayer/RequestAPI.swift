// The Swift Programming Language
// https://docs.swift.org/swift-book

import Moya

public enum API {
    case urlRequest(baseURL: String, requestParameters: [String : Any])
}

extension API: NetworkTarget {
    
    public var baseURLString: String {
        switch self {
        case .urlRequest(let baseURL, _):
            return baseURL
        }
    }
    
    public var path: String {
        return ""
    }
    
    public var requestParameters: [String : Any] {
        switch self {
        case .urlRequest(_, let parameters):
            return parameters
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
}
