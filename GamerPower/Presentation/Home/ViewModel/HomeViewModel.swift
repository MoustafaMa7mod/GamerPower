//
//  HomeViewModel.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import Foundation
import Domain

final class HomeViewModel: ObservableObject {

    private var useCase: GetGiveawaysUseCase
    
    init(
        useCase: GetGiveawaysUseCase
    ) {
        self.useCase = useCase
        
        loadData()
    }
}

// MARK: - Private Methods
extension HomeViewModel {
    
    func loadData() {
        
        Task(priority: .background) {
            
            do {
                let items = try await useCase.execute()
                print("DEBUG: items \(items)")
                await reloadView()
            } catch let error {
                await reloadView()
            }
        }
    }
    
    /// Triggers a UI update after the data has been modified.
    @MainActor
    private func reloadView() {
        objectWillChange.send()
    }
}
