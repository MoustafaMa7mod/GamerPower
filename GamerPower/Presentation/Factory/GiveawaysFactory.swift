//
//  GiveawaysFactory.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Domain

protocol GiveawaysFactory {
    
    func makeGetGiveawaysUseCase() -> GetGiveawaysUseCase
}
