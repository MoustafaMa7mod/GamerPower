//
//  MockWeatherRepository+MockData.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 15/02/2025.
//

import Domain

extension MockGiveawaysRepository {
    
    public func makeMockResponse() -> [GiveawayItem] {
        [
            GiveawayItem(
                id: 3080,
                title: "F1 Manager 2024 (Epic Games) Giveaway",
                worth: "$34.99",
                image: "https://www.gamerpower.com/offers/1b/67addd7ff110f.jpg",
                description: "Today is a great day to kick-start your F1 career!",
                expiryDate: "2025-02-20 23:59:00",
                gameType: "Game",
                platforms: "PC, Epic Games Store",
                numberOfUsers: 3180
            ),
            GiveawayItem(
                id: 3079,
                title: "Exoborne Playtest (Steam) Key Giveaway",
                worth: "N/A",
                image: "https://www.gamerpower.com/offers/1b/67ad12fef3cf1.jpg",
                description: "Claim your free Exoborne Playtest Steam key and be one of the first players to join the playtest",
                expiryDate: "2025-02-17 23:59:00",
                gameType: "Early Access",
                platforms: "PC, Steam",
                numberOfUsers: 1520
            )
        ]
    }
}
