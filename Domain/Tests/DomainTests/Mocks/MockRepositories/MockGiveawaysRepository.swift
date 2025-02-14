//
//  MockGiveawaysRepository.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import Domain
import Foundation

class MockGiveawaysRepository: GiveawaysRepository {
    
    var shouldThrowError = false

    public func fetchGetGiveaways(queryParameter: String?) async throws -> [GiveawayItem] {
        
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
    
        return makeMockResponse()
    }
}
