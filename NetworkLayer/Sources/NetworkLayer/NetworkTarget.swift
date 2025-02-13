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
    var endpointPath: String { get }
}

extension NetworkTarget {
    
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else { fatalError("Invalid Base URL") }
        return url
    }
    
    var path: String {
        return endpointPath
    }
        
    var task: Task {
        return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
