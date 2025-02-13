//
//  GiveawayDataModel.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

public struct GiveawayDataModel: Codable {
    
    let id: Int?
    let title: String?
    let worth: String?
    let image: String?
    let description: String?
    let endDate: String?
    let type: String?
    let platforms: String?
    let users: Int?
    
    enum CodingKeys: String, CodingKey {
        case endDate = "end_date"
        case id, title, worth, image, description, type, platforms, users
    }

    public func toDomain() -> GiveawayItem {
        GiveawayItem(
            id: id ?? 0,
            title: title ?? "",
            worth: worth ?? "",
            image: image ?? "",
            description: description ?? "",
            expiryDate: endDate ?? "",
            gameType: type ?? "",
            platforms: platforms ?? "",
            numberOfUsers: users ?? 0
        )
    }
}
