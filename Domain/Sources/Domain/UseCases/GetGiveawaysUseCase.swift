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

    // MARK: - Life cycle
    
    public init(repository: GiveawaysRepository) {
        self.repository = repository
    }

    // MARK: - Methods
    
    public func execute(queryParameter: String?) async throws -> [GiveawayItem] {
        
        try await repository.fetchGetGiveaways(queryParameter: queryParameter)
    }
}
