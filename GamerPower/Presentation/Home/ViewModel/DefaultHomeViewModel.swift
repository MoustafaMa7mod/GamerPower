//
//  DefaultHomeViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Foundation
import Domain

final class DefaultHomeViewModel: HomeViewModel {
    
    private(set) var giveawayItems: [GiveawayItemPresentationModel] = []
    private(set) var moreCategoriesGiveaways: [String: [GiveawayItemPresentationModel]] = [:]
    private(set) var homeCategories: [String] = ["all"]
    private(set) var selectedIndex: Int = 0
    private(set) var isLoading: Bool = true
    private(set) var isShowError: Bool = false
    private(set) var errorMessage: String?

    private var useCase: GetGiveawaysUseCase
    private var maxCategoriesNumber: Int = 3
    private weak var coordinator: AppCoordinator?

    init(useCase: GetGiveawaysUseCase, coordinator: AppCoordinator?) {
        self.useCase = useCase
        self.coordinator = coordinator
        
        loadHomeData(filterData: false)
    }
    
    /// Handles the selection of a category filter based on the given index.
    ///
    /// - When **index = 0**, it loads all giveaway items without filtering.
    /// - When **index = (maxCategoriesNumber + 1)**, it navigates to the "More Categories" screen.
    /// - Otherwise, it applies a filter based on the selected category and updates the displayed items.
    ///
    /// - Parameter index: The index of the selected filter.
    func filterTapped(with index: Int) {
        selectedIndex = index
        
        switch index {
        case 0:
            loadHomeData(filterData: true)
        case (maxCategoriesNumber + 1):
            coordinator?.navigateToMoreView(items: moreCategoriesGiveaways)
        default:
            loadHomeData(
                filterData: true,
                queryParameter: homeCategories[index].lowercased().replacingOccurrences(
                    of: " ",
                    with: "-"
                )
            )
        }
    }
    
    func navigateToDetails(item: GiveawayItemPresentationModel) {
        coordinator?.navigateToDetailsView(item: item)
    }
}

// MARK: - HomeViewModel
extension DefaultHomeViewModel {
    
    func fetchHomeData(filterData: Bool, queryParameter: String? = nil) async throws {
        let items = try await useCase.execute(queryParameter: queryParameter)
        giveawayItems = items.map { GiveawayItemPresentationModel(model: $0) }
        loadHomeCategories(filterData: filterData)
    }
    
    /// Loads and organizes giveaway categories for display on the home screen.
    ///
    /// - If `filterData` is `false`, the function extracts all unique categories from `giveawayItems`,
    ///   limits the number of displayed categories, and stores additional ones separately.
    /// - If the number of unique categories exceeds `maxCategoriesNumber`, a "More" category is added.
    ///
    /// - Parameter filterData: A Boolean value indicating added more categories or not.
    func loadHomeCategories(filterData: Bool) {
        
        if !filterData {
            let allCategories = giveawayItems.flatMap {
                $0.categoryName.components(separatedBy: ", ")
            }
            
            let categoryItems = Array(Set(allCategories)).sorted()
            
            homeCategories.append(contentsOf: categoryItems.prefix(maxCategoriesNumber))
        
            if categoryItems.count > maxCategoriesNumber {
                homeCategories.append("More")
            }
            
            moreCategories()
        }
    }
}

// MARK: - Private Methods
extension DefaultHomeViewModel {
    
    private func loadHomeData(filterData: Bool, queryParameter: String? = nil) {
        
        Task(priority: .background) {
            
            await resetView()
            do {
                try await fetchHomeData(filterData: filterData, queryParameter: queryParameter)
                await reloadView()
            } catch {
                await handleResponseError(error)
            }
        }
    }
    
    @MainActor
    private func handleResponseError(_ error: Error) {
        isShowError = true
        errorMessage = error.localizedDescription
        giveawayItems.removeAll()
        reloadView()
    }
    
    /// Triggers a UI update after the data has been modified.
    @MainActor
    private func reloadView() {
        isLoading = false
        objectWillChange.send()
    }
    
    @MainActor
    private func resetView() {
        isLoading = true
        isShowError = false
        errorMessage = nil
    }
    
    /// Organizes giveaways into additional categories that are not part of `homeCategories`.
    ///
    /// - This method iterates through all `giveawayItems` and extracts their category names.
    /// - If a category is **not already included** in `homeCategories`,
    ///   the corresponding giveaways are grouped under `moreCategoriesGiveaways`.
    private func moreCategories() {

        for giveaway in giveawayItems {
            // Extract multiple category names from the giveaway item
            let categories = giveaway.categoryName.components(separatedBy: ", ")
            for category in categories {
                // If the category is not in the main home categories, add it to the additional categories
                if !homeCategories.contains(category) {
                    moreCategoriesGiveaways[category, default: []].append(giveaway)
                }
            }
        }
    }
}
