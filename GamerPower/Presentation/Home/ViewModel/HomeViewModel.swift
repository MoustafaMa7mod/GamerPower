//
//  HomeViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI

protocol HomeViewModel: ObservableObject {
   
    var giveawayItems: [GiveawayItemPresentationModel] { get }
    var homeCategories: [String] { get }
    var moreCategoriesGiveaways: [String: [GiveawayItemPresentationModel]] { get }
    var selectedIndex: Int { get }
    var isLoading: Bool { get }
    var isShowError: Bool { get }
    var errorMessage: String? { get }
    
    func filterTapped(with index: Int)
}
