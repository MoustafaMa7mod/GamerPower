//
//  MockGetGiveawaysRemoteAPI+MockData.swift
//  Data
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Data

extension MockGetGiveawaysRemoteAPI {
    
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
            )
        ]
    }
}
