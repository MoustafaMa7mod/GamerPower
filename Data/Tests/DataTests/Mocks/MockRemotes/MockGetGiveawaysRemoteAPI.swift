//
//  MockGetGiveawaysRemoteAPI.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Data
import Foundation

final class MockGetGiveawaysRemoteAPI: GetGiveawaysRemoteAPI {
    
    var shouldThrowError = false

    func fetchGetGiveaways(queryParameter: String?) async throws -> [GiveawayDataModel] {

        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        
        return makeMockResponse()
    }
}
