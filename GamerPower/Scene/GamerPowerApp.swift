//
//  GamerPowerApp.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI

@main
struct GamerPowerApp: App {

    let factory: GiveawaysFactory
    
    init() {
        factory = DefaultGiveawaysFactory()
    }

    var body: some Scene {
        WindowGroup {
            
            HomeView(
                viewModel: HomeViewModel(useCase: factory.makeGetGiveawaysUseCase())
            )
        }
    }
}
