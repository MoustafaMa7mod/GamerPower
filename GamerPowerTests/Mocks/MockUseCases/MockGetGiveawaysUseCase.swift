//
//  MockGetGiveawaysUseCase.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import Foundation
import Domain

final class MockGetGiveawaysUseCase: GetGiveawaysUseCase {
    
    var shouldThrowError = false
    
    func execute(queryParameter: String?) async throws -> [GiveawayItem] {
        
        if shouldThrowError {
            throw NSError(
                domain: "Mock Error",
                code: 500,
                userInfo: [NSLocalizedDescriptionKey: "Failed to fetch giveaways"]
            )
        }
        
        return makeMockResponse()
    }
}
