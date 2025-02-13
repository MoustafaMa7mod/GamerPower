//
//  GiveawaysDataModel.swift
//  Data
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

public struct GiveawaysDataModel: Codable {
    
    let id: Int?
    
    public func toDomain() -> GiveawayItems {
        GiveawayItems(id: id ?? 0)
    }
}
