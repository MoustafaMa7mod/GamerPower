//
//  GamePowerRemoteAPI.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import NetworkLayer

public protocol GetGiveawaysRemoteAPI {
    func fetchGetGiveaways() async throws -> [GiveawaysDataModel]
}

public final class DefaultGetGiveawaysRemoteAPI: GetGiveawaysRemoteAPI {
    
    private let networkService: NetworkService

    // MARK: - Life cycle
    
    public init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    public func fetchGetGiveaways() async throws -> [GiveawaysDataModel] {
        
        let result: [GiveawaysDataModel] = try await networkService.fetchData(
            baseURL: "https://www.gamerpower.com/api/giveaways"
        )

        return result
    }
}
