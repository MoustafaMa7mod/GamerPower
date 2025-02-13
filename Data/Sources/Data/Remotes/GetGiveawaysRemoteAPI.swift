//
//  GamePowerRemoteAPI.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import NetworkLayer

public protocol GetGiveawaysRemoteAPI {
    func fetchGetGiveaways() async throws -> [GiveawayDataModel]
}

public final class DefaultGetGiveawaysRemoteAPI: GetGiveawaysRemoteAPI {
    
    private let networkService: NetworkService

    // MARK: - Life cycle
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func fetchGetGiveaways() async throws -> [GiveawayDataModel] {
        
        let result: [GiveawayDataModel] = try await networkService.fetchData(
            path: Constants.Paths.giveaways
        )

        return result
    }
}
