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

    func navigateToDetails(item: GiveawayItemPresentationModel) {
        let view = factory.makeDetailsView(item: item)
        navigationController.pushViewController(view, animated: true)
    }
}
