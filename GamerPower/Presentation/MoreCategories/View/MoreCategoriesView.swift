//
//  MoreCategoriesView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct MoreCategoriesView<ViewModel>: View where ViewModel: DefaultMoreCategoriesViewModel {
    
    @StateObject var viewModel: ViewModel
    private let viewHeight: CGFloat = 220
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading) {
                sectionsView
            }
        }
        .padding(.top, 12)
    }
    
    /// Displays a list of giveaway categories, each containing a horizontally scrollable carousel of giveaway items.
    ///
    /// The categories are dynamically sorted and displayed as sections, where each section has a header
    /// with the category name. The items within each category are presented using `CarouselScrollView`.
    var sectionsView: some View {
        
        ForEach(viewModel.items.keys.sorted(), id: \.self) { category in
            
            Section(header: Text(category)
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.bottom, 2)
            ) {
                
                if let categories = viewModel.items[category] {
                    
                    CarouselScrollView(
                        items: categories) { item in
                            viewModel.navigateToDetails(item: item)
                        }
                        .padding(.top, 0)
                }
            }
        }
    }
}
