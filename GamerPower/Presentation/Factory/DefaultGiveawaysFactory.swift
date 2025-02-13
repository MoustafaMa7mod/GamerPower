//
//  DefaultWeatherFactory.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain
import Data
import NetworkLayer

final class DefaultGiveawaysFactory: GiveawaysFactory {

    func makeGetGiveawaysUseCase() -> GetGiveawaysUseCase {
        DefaultGetGiveawaysUseCase(repository: makeGiveawaysRepository())
    }
}

// MARK: - Giveaways Use Case Dependency Creation
extension DefaultGiveawaysFactory {
    
    private func makeGiveawaysRepository() -> GiveawaysRepository {
        DefaultGetGiveawaysRepository(remote: makeGetGiveawaysRemoteAPI())
    }
    
    private func makeGetGiveawaysRemoteAPI() -> GetGiveawaysRemoteAPI {
        DefaultGetGiveawaysRemoteAPI(
            networkService: NetworkService(baseURL: ConfigurationManager.shared.baseURL)
        )
    }
}
