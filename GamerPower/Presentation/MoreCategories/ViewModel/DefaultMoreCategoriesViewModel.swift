//
//  DefaultMoreCategoriesViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

final class DefaultMoreCategoriesViewModel: MoreCategoriesViewModel {

    private(set) var items: [String: [GiveawayItemPresentationModel]] = [:]
    
    private weak var coordinator: AppCoordinator?

    init(
        items: [String: [GiveawayItemPresentationModel]],
        coordinator: AppCoordinator?
    ) {
        self.items = items
        self.coordinator = coordinator
    }
    
    func navigateToDetails(item: GiveawayItemPresentationModel) {
        coordinator?.navigateToDetailsView(item: item)
    }
}
