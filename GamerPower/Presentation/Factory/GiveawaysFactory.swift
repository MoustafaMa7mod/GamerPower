//
//  GiveawaysFactory.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain
import SwiftUI

protocol GiveawaysFactory {
    
    func makeHomeView(
        coordinator: AppCoordinator?
    ) -> UIHostingController<HomeView<DefaultHomeViewModel>>
    
    func makeDetailsView(
        item: GiveawayItemPresentationModel
    ) -> UIHostingController<DetailsView>
    
    func makeMoreCategoriesView(
        items: [String: [GiveawayItemPresentationModel]],
        coordinator: AppCoordinator?
    ) -> UIHostingController<MoreCategoriesView<DefaultMoreCategoriesViewModel>>
}
