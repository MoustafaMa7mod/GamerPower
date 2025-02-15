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

    public func fetchGetGiveaways(
        queryParameter: String?
    ) async throws -> [GiveawayItem] {
        
        let response = try await remote.fetchGetGiveaways(queryParameter: queryParameter)
        return response.map { $0.toDomain() }
    }
}
