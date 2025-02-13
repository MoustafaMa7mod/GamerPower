//
//  DetailsView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI
import Kingfisher

struct DetailsView<ViewModel>: View where ViewModel: DefaultDetailsViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 12) {
                    
                ScrollView(.vertical, showsIndicators: false) {
                    cardImage
                    HStack(alignment: .center, spacing: 2) {
                        gamePrice
                        divider
                        numberOfUsers
                        divider
                        gameType
                    }
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        gameCategory
                        giveawayEndData
                        gameDescription
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 12)
            .background(Color.white)
        }
    }
    
    var cardImage: some View {
        
        ZStack(alignment: .bottomLeading) {
           
            gameImage

            VStack(alignment: .leading, spacing: 6) {
                gameTitle
            }
            .padding(12)
        }
        .frame(height: 300)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
    
    @ViewBuilder
    var gameImage: some View {
        
        if let image = viewModel.item.gameImage {
            
            KFImage(image)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 32, height: 300)
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.9), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
    
    var gameTitle: some View {
        
        Text(viewModel.item.gameTitle)
            .font(.system(size: 18, weight: .heavy))
            .foregroundColor(.white)
            .frame(alignment: .leading)
    }
    
    var gamePrice: some View {
        
        VStack(alignment: .center, spacing: 4) {
            Image("coin")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text(viewModel.item.gamePrice)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
    
    var numberOfUsers: some View {
        
        VStack(alignment: .center, spacing: 4) {
            Image("friends")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text(viewModel.item.numberOfUsers)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
    
    var gameType: some View {
        
        VStack(alignment: .center, spacing: 4) {
            Image("games")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text(viewModel.item.gameType)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
    }
    
    var divider: some View {
        
        Divider()
            .frame(width: 1)
            .background(.black)
    }
    
    var gameCategory: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Platforms")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            
            Text(viewModel.item.categoryName)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var giveawayEndData: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Giveaway End Date")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            
            Text(viewModel.item.giveawayEndData)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var gameDescription: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Description")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            
            Text(viewModel.item.gameDescription)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

}
