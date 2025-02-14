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
    ) -> UIHostingController<DetailsView<DefaultDetailsViewModel>> {
        
        let viewModel = DefaultDetailsViewModel(item: item)
        let view = DetailsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
    
    func makeMoreCategoriesView(
        items: [String: [GiveawayItemPresentationModel]]
    ) -> UIHostingController<MoreCategoriesView> {
        
        let view = MoreCategoriesView(items: items)
        return UIHostingController(rootView: view)
    }
}

// MARK: - Giveaways Use Case Dependency Creation
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
