//
//  GiveawaysDataModel.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

public struct GiveawaysDataModel: Codable {
    
    let id: Int?
    let title: String?
    let worth: String?
    let image: String?
    let description: String?
    let instructions: String?
    let endDate: String?
    let type: String?
    let platforms: String?
    let users: Int?
    
    enum CodingKeys: String, CodingKey {
        case endDate = "end_date"
        case id, title, worth, image, description, instructions, type, platforms, users
    }

    public func toDomain() -> GiveawayItems {
        GiveawayItems(
            id: id ?? 0,
            title: title ?? "",
            worth: worth ?? "",
            image: image ?? "",
            description: description ?? "",
            instructions: instructions ?? "",
            expiryDate: endDate ?? "",
            gameType: type ?? "",
            platforms: platforms ?? "",
            numberOfUsers: users ?? 0
        )
    }
}
