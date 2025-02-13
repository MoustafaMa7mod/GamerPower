//
//  GiveawaysRepository.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

public protocol GiveawaysRepository {
    
    func fetchGetGiveaways() async throws -> [GiveawayItems]
}
