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
        
        NavigationView {
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.gray)
            } else {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    platformView
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        cardView
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 12)
                .background(Color.white)
                .navigationBarTitle("Games Giveaways")
            }
        }
        .alert(viewModel.errorMessage ?? "", isPresented: .constant(viewModel.isShowError)) {
            Button("OK", role: .cancel) { }
        }
        
    }
    
    var platformView: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 10) {
                ForEach(Array(viewModel.categories.enumerated()), id: \.element) { index, item in
                    
                    Text(item)
                        .fontWeight(viewModel.selectedIndex == index ? .bold : .regular)
                        .foregroundColor(item == "More" ? .blue : .black)
                        .onTapGesture {
                            viewModel.filterTapped(with: index)
                        }
                }
            }
        }
    }
    
    var cardView: some View {
        
        ForEach(viewModel.giveawayItems) { item in
            VStack(alignment: .leading, spacing: 8){
                GiveawayCard(item: item)
            }
        }
    }
}
