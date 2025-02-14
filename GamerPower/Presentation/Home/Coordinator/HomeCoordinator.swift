//
//  HomeCoordinator.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import UIKit
import SwiftUI

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let factory: DefaultGiveawaysFactory

    init(
        navigationController: UINavigationController,
        factory: DefaultGiveawaysFactory = DefaultGiveawaysFactory()
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }

    func start() {
        
        let homeView = factory.makeHomeView(coordinator: self)
        navigationController.viewControllers = [homeView]
    }

    func navigateToDetailsView(item: GiveawayItemPresentationModel) {
        let view = factory.makeDetailsView(item: item)
        view.title = item.gameTitle
        navigationController.pushViewController(view, animated: true)
    }
    
    func navigateToMoreView(items: [String: [GiveawayItemPresentationModel]]) {
        let view = factory.makeMoreCategoriesView(items: items)
        view.title = "Categories"
        navigationController.pushViewController(view, animated: true)
    }
}
