//
//  DefaultWeatherFactory.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain
import Data
import NetworkLayer
import SwiftUI

final class DefaultGiveawaysFactory: GiveawaysFactory {

    func makeHomeView(
        coordinator: AppCoordinator?
    ) -> UIHostingController<HomeView<DefaultHomeViewModel>> {
        
        let viewModel = DefaultHomeViewModel(
            useCase: makeGetGiveawaysUseCase(),
            coordinator: coordinator
        )
        let view = HomeView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
    
    func makeDetailsView(
        item: GiveawayItemPresentationModel
    ) -> UIHostingController<DetailsView> {
        
        let view = DetailsView(item: item)
        return UIHostingController(rootView: view)
    }
    
    func makeMoreCategoriesView(
        items: [String: [GiveawayItemPresentationModel]],
        coordinator: AppCoordinator?
    ) -> UIHostingController<MoreCategoriesView<DefaultMoreCategoriesViewModel>> {
        
        let viewModel = DefaultMoreCategoriesViewModel(
            items: items,
            coordinator: coordinator
        )
        
        let view = MoreCategoriesView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}

// MARK: - Giveaways View Model Dependency Creation
extension DefaultGiveawaysFactory {
    
    private func makeGetGiveawaysUseCase() -> GetGiveawaysUseCase {
        DefaultGetGiveawaysUseCase(repository: makeGiveawaysRepository())
    }
    
    private func makeGiveawaysRepository() -> GiveawaysRepository {
        DefaultGetGiveawaysRepository(remote: makeGetGiveawaysRemoteAPI())
    }
    
    private func makeGetGiveawaysRemoteAPI() -> GetGiveawaysRemoteAPI {
        DefaultGetGiveawaysRemoteAPI(
            networkService: NetworkService(baseURL: ConfigurationManager.shared.baseURL)
        )
    }
}
