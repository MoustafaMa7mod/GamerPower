//
//  PresentationModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain
import SwiftUI

struct GiveawayItemPresentationModel: Identifiable {
 
    let id: Int
    let gameTitle: String
    let gamePrice: String
    let image: String
    let gameDescription: String
    let expiryDate: String
    let gameType: String
    let categoryName: String
    let numberOfUsers: String

    var gameImage: URL? {
        URL(string: "\(image)")
    }
    
    var giveawayEndData: String {
        expiryDate.formattedDate
    }
    
    init(model: GiveawayItem) {
        
        self.id = model.id
        self.gameTitle = model.title
        self.gamePrice = model.worth
        self.image = model.image
        self.gameDescription = model.description
        self.expiryDate = model.expiryDate
        self.gameType = model.gameType
        self.categoryName = model.category
        self.numberOfUsers = "\(model.numberOfUsers)"
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
