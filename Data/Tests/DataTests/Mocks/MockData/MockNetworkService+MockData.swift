//
//  MockNetworkService+MockData.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Foundation
import Data

extension MockNetworkService {
    
    public func makeMockResponse() -> [GiveawayDataModel] {
        [
            GiveawayDataModel(
                id: 3080,
                title: "F1 Manager 2024 (Epic Games) Giveaway",
                worth: "$34.99",
                image: "https://www.gamerpower.com/offers/1b/67addd7ff110f.jpg",
                description: "Today is a great day to kick-start your F1 career!",
                endDate: "2025-02-20 23:59:00",
                type: "Game",
                platforms: "PC, Epic Games Store",
                users: 3180
            ),
            GiveawayDataModel(
                id: 3079,
                title: "Exoborne Playtest (Steam) Key Giveaway",
                worth: "N/A",
                image: "https://www.gamerpower.com/offers/1b/67ad12fef3cf1.jpg",
                description: "Claim your free Exoborne Playtest Steam key and be one of the first players to join the playtest",
                endDate: "2025-02-17 23:59:00",
                type: "Early Access",
                platforms: "PC, Steam",
                users: 1520
            )
        ]
    }
}
