//
//  AppCoordinator.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI
import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let factory: DefaultGiveawaysFactory
    let navigationController: UINavigationController

    init(
        window: UIWindow,
        navigationController: UINavigationController = UINavigationController(),
        factory: DefaultGiveawaysFactory = DefaultGiveawaysFactory()
    ) {
        self.window = window
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        
        let homeView = factory.makeHomeView(coordinator: self)
        navigationController.viewControllers = [homeView]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
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
