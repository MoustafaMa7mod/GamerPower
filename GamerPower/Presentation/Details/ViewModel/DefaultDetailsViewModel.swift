//
//  DefaultDetailsViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Foundation
import Domain

final class DefaultDetailsViewModel: DetailsViewModel {

    private(set) var item: GiveawayItemPresentationModel

    init(item: GiveawayItemPresentationModel) {
        self.item = item
    }
}
