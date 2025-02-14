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
    
    public init(
        id: Int?,
        title: String?,
        worth: String?,
        image: String?,
        description: String?,
        endDate: String?,
        type: String?,
        platforms: String?,
        users: Int?
    ) {
        self.id = id
        self.title = title
        self.worth = worth
        self.image = image
        self.description = description
        self.endDate = endDate
        self.type = type
        self.platforms = platforms
        self.users = users
    }
    
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
