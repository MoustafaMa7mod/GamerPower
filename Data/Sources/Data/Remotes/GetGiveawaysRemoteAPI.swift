//
//  GamePowerRemoteAPI.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import NetworkLayer

public protocol GetGiveawaysRemoteAPI {
    func fetchGetGiveaways(queryParameter: String?) async throws -> [GiveawayDataModel]
}

public final class DefaultGetGiveawaysRemoteAPI: GetGiveawaysRemoteAPI {
    
    // MARK: - Properties
    private let networkService: Networkable

    // MARK: - Methods
    public init(networkService: Networkable) {
        self.networkService = networkService
    }
    
    public func fetchGetGiveaways(queryParameter: String?) async throws -> [GiveawayDataModel] {
        var parameters: [String: Any] = [:]
        
        if let queryParameter {
            parameters["platform"] = queryParameter
        }
        
        let result: [GiveawayDataModel] = try await networkService.fetchData(
            requestParameters: parameters
        )

        return result
    }
}
