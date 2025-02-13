//
//  DefaultHomeViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Foundation
import Domain

final class DefaultHomeViewModel: HomeViewModel {

    private var useCase: GetGiveawaysUseCase
    private var maxCategoriesNumber: Int = 3
    private(set) var giveawayItems: [GiveawayItemPresentationModel] = []
    private(set) var categories: [String] = ["all"]
    private(set) var selectedIndex: Int = 0
    private(set) var isLoading: Bool = true
    private(set) var isShowError: Bool = false
    private(set) var errorMessage: String?

    init(useCase: GetGiveawaysUseCase) {
        self.useCase = useCase
        
        loadData(filterData: false)
    }
    
    func filterTapped(with index: Int) {
        selectedIndex = index
        
        switch index {
        case 0: // all items not need filter data
            loadData(filterData: true)
        case 4: // Navigate to more screen
            print("Navigate to more screen")
            Task { @MainActor in
                reloadView()
            }
        default:
            loadData(
                filterData: true,
                queryParameter: categories[index].lowercased().replacingOccurrences(of: " ", with: "-")
            )
        }
    }
}

// MARK: - Private Methods
extension DefaultHomeViewModel {
    
    func loadData(filterData: Bool, queryParameter: String? = nil) {
        
        Task(priority: .background) {
            await resetView()
            do {
                let items = try await useCase.execute(queryParameter: queryParameter)
                giveawayItems = items.map { GiveawayItemPresentationModel(model: $0) }
                
                if !filterData {
                    let allCategories = giveawayItems.flatMap {
                        $0.categoryName.components(separatedBy: ", ")
                    }
                    let categoryItems = Array(Set(allCategories)).sorted()
                    
                    categories.append(contentsOf: categoryItems.prefix(maxCategoriesNumber))
                
                    if categoryItems.count > maxCategoriesNumber {
                        categories.append("More")
                    }
                }
                await reloadView()
            } catch let error {
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
}
