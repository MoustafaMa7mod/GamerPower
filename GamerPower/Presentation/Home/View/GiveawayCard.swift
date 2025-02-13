//
//  GiveawayCard.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI
import Kingfisher
import Domain

struct GiveawayCard: View {
    
    var item: GiveawayItemPresentationModel
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
           
            gameImage

            VStack(alignment: .leading, spacing: 6) {
                gameTitle
                gameCategory
                
                Spacer()
                gameDescription
            }
            .padding(12)
        }
        .frame(height: 350)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
    
    @ViewBuilder
    var gameImage: some View {
        
        if let image = item.gameImage {
            
            KFImage(image)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 32, height: 350)
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
        
        Text(item.gameTitle)
            .font(.system(size: 18, weight: .heavy))
            .foregroundColor(.white)
    }
    
    var gameCategory: some View {
        
        Text(item.categoryName)
            .font(.system(size: 16, weight: .light))
            .foregroundColor(.white)
    }
    
    var gameDescription: some View {
        
        Text(item.gameDescription)
            .font(.system(size: 16, weight: .light))
            .foregroundColor(.white)
    }
}
