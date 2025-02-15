//
//  HomeViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI

protocol HomeViewModel: ObservableObject {
   
    // MARK: - Properties
    var giveawayItems: [GiveawayItemPresentationModel] { get }
    var homeCategories: [String] { get }
    var moreCategoriesGiveaways: [String: [GiveawayItemPresentationModel]] { get }
    var selectedIndex: Int { get }
    var isLoading: Bool { get }
    var isShowError: Bool { get }
    var errorMessage: String? { get }
    
    // MARK: - Methods
    func fetchHomeData(filterData: Bool, queryParameter: String?) async throws
    func loadHomeCategories(filterData: Bool)
    func filterTapped(with index: Int)
    func navigateToDetails(item: GiveawayItemPresentationModel)
}
