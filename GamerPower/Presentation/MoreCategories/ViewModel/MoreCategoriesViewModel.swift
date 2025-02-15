//
//  MoreCategoriesViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

protocol MoreCategoriesViewModel: ObservableObject {
    
    // MARK: - Properties
    var items: [String: [GiveawayItemPresentationModel]] { get }
    
    // MARK: - Methods
    func navigateToDetails(item: GiveawayItemPresentationModel)
}
