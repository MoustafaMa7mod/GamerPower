//
//  DefaultGetGiveawaysRepository.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

public final class DefaultGetGiveawaysRepository: GiveawaysRepository {
    
    // MARK: - Properties
    private let remote: GetGiveawaysRemoteAPI

    // MARK: - Methods
    
    public init(remote: GetGiveawaysRemoteAPI) {
        self.remote = remote
    }

    public func fetchGetGiveaways() async throws -> [GiveawayItem] {
        
        let response = try await remote.fetchGetGiveaways()
        return response.map { $0.toDomain() }
    }
}
