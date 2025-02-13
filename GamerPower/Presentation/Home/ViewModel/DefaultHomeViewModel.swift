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
    private(set) var giveawayItems: [GiveawayItemPresentationModel] = []
    private(set) var platforms: [String] = ["all"]
    private(set) var selectedIndex: Int = 0
    private(set) var isLoading: Bool = false
    private(set) var isShowError: Bool = false
    private(set) var errorMessage: String = ""

    init(
        useCase: GetGiveawaysUseCase
    ) {
        self.useCase = useCase
        
        loadData()
    }
    
    func filterTapped(with index: Int) {
        selectedIndex = index
        Task { @MainActor in
            reloadView()
        }
    }
}

// MARK: - Private Methods
extension DefaultHomeViewModel {
    
    func loadData() {
        
        Task(priority: .background) {
            
            do {
                let items = try await useCase.execute()
                giveawayItems = items.map { GiveawayItemPresentationModel(model: $0) }
                let allPlatforms = giveawayItems.flatMap {
                    $0.platforms.components(separatedBy: ", ")
                }
                let platformItems = Array(Set(allPlatforms))
                    .sorted()
                    .map {
                        $0.lowercased()
                    }
                
                platforms.append(contentsOf: platformItems.prefix(4))
            
                if platformItems.count > 4 {
                    platforms.append("More")
                }
                
                await reloadView()
            } catch let error {
                await handleResponseError(error)
            }
        }
    }
    
    @MainActor
    private func handleResponseError(_ error: Error) {
        isLoading = false
        isShowError = true
        errorMessage = error.localizedDescription
        reloadView()
    }
    
    /// Triggers a UI update after the data has been modified.
    @MainActor
    private func reloadView() {
        objectWillChange.send()
    }
}
