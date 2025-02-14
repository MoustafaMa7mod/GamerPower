//
//  MockEndpointClosure.swift
//  NetworkLayer
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Moya
import Foundation
@testable import NetworkLayer

extension NetworkServiceTests {
    
    func mockEndpointClosure() -> (API) -> Endpoint {
        
        let sampleData = """
        {
            "id": 1,
            "name": "Test Item"
        }
        """.data(using: .utf8)!
        
        return { (target: API) -> Endpoint in
            return Endpoint(
                url: target.baseURL.absoluteString,
                sampleResponseClosure: { .networkResponse(200, sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
    }
    
    func mockFailingProvider() -> MoyaProvider<API> {
        
        return MoyaProvider<API>(endpointClosure: { target in
            return Endpoint(
                url: target.baseURL.absoluteString,
                sampleResponseClosure: {
                    .networkError(NSError(domain: "Test", code: 1, userInfo: nil))
                },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }, stubClosure: MoyaProvider.immediatelyStub)
    }
}
