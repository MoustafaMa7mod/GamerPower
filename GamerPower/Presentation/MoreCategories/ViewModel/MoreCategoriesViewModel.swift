//
//  MoreCategoriesViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

protocol MoreCategoriesViewModel: ObservableObject {
   
    var items: [String: [GiveawayItemPresentationModel]] { get }
    
    func navigateToDetails(item: GiveawayItemPresentationModel)
}
