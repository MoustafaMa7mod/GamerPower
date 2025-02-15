//
//  GetGiveawaysUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

public protocol GetGiveawaysUseCase {
    
    func execute(queryParameter: String?) async throws -> [GiveawayItem]
}

public final class DefaultGetGiveawaysUseCase: GetGiveawaysUseCase {

    // MARK: - Properties
    private let repository: GiveawaysRepository

    // MARK: - Methods
    public init(repository: GiveawaysRepository) {
        self.repository = repository
    }
    
    public func execute(queryParameter: String?) async throws -> [GiveawayItem] {
        
        try await repository.fetchGetGiveaways(queryParameter: queryParameter)
    }
}
