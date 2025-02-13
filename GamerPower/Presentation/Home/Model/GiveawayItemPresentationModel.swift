//
//  PresentationModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

struct GiveawayItemPresentationModel: Identifiable {
 
    let id: Int
    let gameTitle: String
    let gamePrice: String
    let gameImage: String
    let gameDescription: String
    let gameInstructions: String
    let expiryDate: String
    let gameType: String
    let platforms: String
    let numberOfUsers: Int

    init(model: GiveawayItem) {
        
        self.id = model.id
        self.gameTitle = model.title
        self.gamePrice = model.worth
        self.gameImage = model.image
        self.gameDescription = model.description
        self.gameInstructions = model.instructions
        self.expiryDate = model.expiryDate
        self.gameType = model.gameType
        self.platforms = model.platforms
        self.numberOfUsers = model.numberOfUsers
    }
}

 // MARK: - Conform Equatable
extension GiveawayItemPresentationModel: Equatable {

    static func == (
        lhs: GiveawayItemPresentationModel,
        rhs: GiveawayItemPresentationModel
    ) -> Bool {
        
        return lhs.id == rhs.id
    }
}
