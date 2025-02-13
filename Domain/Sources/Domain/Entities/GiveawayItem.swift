//
//  GiveawayItem.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

public struct GiveawayItem {
    
    public let id: Int
    public let title: String
    public let worth: String
    public let image: String
    public let description: String
    public let expiryDate: String
    public let gameType: String
    public let category: String
    public let numberOfUsers: Int

    public init(
        id: Int,
        title: String,
        worth: String,
        image: String,
        description: String,
        expiryDate: String,
        gameType: String,
        platforms: String,
        numberOfUsers: Int
    ) {
        self.id = id
        self.title = title
        self.worth = worth
        self.image = image
        self.description = description
        self.expiryDate = expiryDate
        self.gameType = gameType
        self.category = platforms
        self.numberOfUsers = numberOfUsers
    }
}
