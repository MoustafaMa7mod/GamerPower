//
//  MockNetworkService.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Moya
import Foundation
@testable import NetworkLayer

class MockNetworkService: Networkable {
    
    var mockResponse: Any?
    var mockError: Error?
    var provider: MoyaProvider<API> {
        fatalError("MockNetworkService does not use MoyaProvider directly")
    }
    
    func fetchData<T: Decodable>(requestParameters: [String : Any]) async throws -> T {
     
        if let error = mockError {
            throw error
        }
        
        guard let response = mockResponse as? T else {
            throw NSError(domain: "MockError", code: -1, userInfo: nil)
        }
        
        return response
    }
}
