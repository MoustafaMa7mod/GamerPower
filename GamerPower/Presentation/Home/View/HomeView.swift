//
//  HomeView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: DefaultHomeViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            platformView
        }
    }
    
    var platformView: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Array(viewModel.platforms.enumerated()), id: \.element) { index, item in
                    
                    Text(item)
                        .fontWeight(viewModel.selectedIndex == index ? .bold : .regular)
                        .foregroundColor(item == "More" ? .blue : .black)
                        .onTapGesture {
                            viewModel.filterTapped(with: index)
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}
