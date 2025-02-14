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
        coordinator: HomeCoordinator?
    ) -> UIHostingController<HomeView<DefaultHomeViewModel>>
    
    func makeDetailsView(
        item: GiveawayItemPresentationModel
    ) -> UIHostingController<DetailsView<DefaultDetailsViewModel>>
}
