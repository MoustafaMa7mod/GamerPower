//
//  NetworkTarget.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Moya
import Foundation

protocol NetworkTarget: TargetType {
    
    var baseURLString: String { get }
    var requestParameters: [String: Any] { get }
}

extension NetworkTarget {
    
    public var baseURL: URL {
        guard let url = URL(string: baseURLString) else { fatalError("Invalid Base URL") }
        return url
    }
    
    public var task: Task {
        return .requestParameters(parameters: requestParameters, encoding: URLEncoding.queryString)
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var sampleData: Data {
        return Data()
    }
}
