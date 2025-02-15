//
//  CarouselScrollView.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import SwiftUI

struct CarouselScrollView: View {
    
    private let viewHeight: CGFloat = 220
    
    var items: [GiveawayItemPresentationModel]
    let tappedAction: (GiveawayItemPresentationModel) -> Void

    /// A horizontally scrolling stack of giveaway cards with a 3D rotation effect.
    /// The cards dynamically rotate based on their position in the scroll view.
    ///
    /// The rotation effect is determined by the card’s horizontal position
    /// in the global coordinate space, giving a parallax-like 3D appearance.
    var body: some View {
        
           ScrollView(.horizontal, showsIndicators: false) {
               
               // -10 to reduces spacing between cards, making them slightly overlap.
               HStack(spacing: -10)  {
                   
                   // Iterate over the items and create a card for each
                   ForEach(items, id: \.id) { item in
                       GeometryReader { proxy in
                           let minX = proxy.frame(in: .global).minX // Get the card's X position in the global coordinate space
                           let screenWidth = UIScreen.main.bounds.width
                           let rotation = -minX / screenWidth * 15 // Calculate rotation effect based on position

                           GiveawayCard(item: item, viewHeight: viewHeight)
                               .frame(width: screenWidth * 0.92, height: viewHeight) // Set card size
                               .cornerRadius(12)
                               .shadow(radius: 4)
                               .rotation3DEffect(
                                   .degrees(rotation), // Apply rotation effect
                                   axis: (x: 0, y: 1, z: 0) // Rotate around the Y-axis
                               )
                               .onTapGesture {
                                   tappedAction(item)
                               }
                       }
                       .frame(
                        width: UIScreen.main.bounds.width * 0.92,
                        height: viewHeight
                       )
                   }
               }
               .padding(.horizontal, 8)
           }
           .frame(height: viewHeight)
       }

}
